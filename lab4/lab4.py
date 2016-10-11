from pyspark.sql import SQLContext
from pyspark.sql.types import *
sqlContext = SQLContext(sc)


#submission1 Code

crimedata =sc.textFile("file:///home/w205/data/Crimes_-_2001_to_present_data.csv")
def remove_header(itr_index, itr): return iter(list(itr)[1:]) if itr_index == 0 else itr
noHeaderCrimeData2 = crimedata.mapPartitionsWithIndex(remove_header)
narcoticsCrimes = noHeaderCrimeData2.filter(lambda x: "NARCOTICS" in x)
narcoticsCrimeRecords = narcoticsCrimes.map(lambda r : r.split(","))
narcoticsCrimeTuples = narcoticsCrimes.map(lambda x: (x.split(",")[0], x))
sorted=narcoticsCrimeTuples.sortByKey()

narcoticsCrimeTuples.take(10)
sorted.take(10)

narcoticsCrimeTuples2 = narcoticsCrimes.map(lambda x: (x.split(",")[0:], x))

narcoticsCrimeTuples2.take(10)
sorted2=narcoticsCrimeTuples2.sortByKey()

#section 6-7
from pyspark.sql import SQLContext
from pyspark.sql.types import *
sqlContext = SQLContext(sc)

lines = sc.textFile('file:///home/w205/data/weblog_lab.csv')
parts = lines.map(lambda l: l.split('\t'))
Web_Session_Log = parts.map(lambda p: (p[0], p[1],p[2],p[3],p[4]))
schemaString = 'DATETIME USERID SESSIONID PRODUCTID REFERERURL'
fields = [StructField(field_name, StringType(), True) for field_name in schemaString.split()]
schema = StructType(fields)
schemaWebData = sqlContext.createDataFrame(Web_Session_Log, schema)
schemaWebData.registerTempTable('Web_Session_Log')

results = sqlContext.sql('SELECT count(*) FROM Web_Session_Log')
results_ebay = sqlContext.sql('SELECT count(*) FROM Web_Session_Log WHERE REFERERURL= "http://www.ebay.com"')

#submission2
results_ebay.show()

#submission3
results.show()
