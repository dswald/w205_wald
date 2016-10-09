#setup hive - assumes volume is already mounted to xvdf
/root/start-hadoop.sh
mount -t ext4 /dev/xvdf /data
/data/start_postgres.sh
su - w205
#confirm hadoop started
hdfs dfs -ls #if no response, exit from su and try again - likely a permission problem

#download the flat files in hive
wget https://data.medicare.gov/views/bg9k-emty/files/2eed33f4-d8c8-4ed7-8aed-e4ca2885cb0a?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip /home/w205/downloads
unzip "/home/w205/downloads/2eed33f4-d8c8-4ed7-8aed-e4ca2885cb0a?content_type=application%2Fzip; charset=binary"

#make sub directory to house cleansed data
mkdir /home/w205/downloads/hospital_clean/


# for my case, I set my working directory below - commented out
cd "C:\Users\Dan\Google Drive\DataSci\205_data_storage\205_git\w205_wald\exercise_1"

# commands for stripping out header and renaming
tail -n +2 '/home/w205/downloads/Hospital General Information.csv' > /home/w205/downloads/hospital_clean/hospitals.csv
tail -n +2 '/home/w205/downloads/Timely and Effective Care - Hospital.csv' > /home/w205/downloads/hospital_clean/effective_care.csv
tail -n +2 '/home/w205/downloads/Readmissions and Deaths - Hospital.csv' > /home/w205/downloads/hospital_clean/readmissions.csv
tail -n +2 '/home/w205/downloads/Measure Dates.csv' > /home/w205/downloads/hospital_clean/measures.csv
tail -n +2 /home/w205/downloads/hvbp_hcahps_06_08_2016.csv > /home/w205/downloads/hospital_clean/survey_responses.csv

# put this into HDFS
hdfs dfs -mkdir /user/w205/hospital_compare/hospitals
hdfs dfs -mkdir /user/w205/hospital_compare/effective_care
hdfs dfs -mkdir /user/w205/hospital_compare/readmissions
hdfs dfs -mkdir /user/w205/hospital_compare/measures
hdfs dfs -mkdir /user/w205/hospital_compare/survey

hdfs dfs -put /home/w205/downloads/hospital_clean/hospitals.csv /user/w205/hospital_compare/hospital
hdfs dfs -put /home/w205/downloads/hospital_clean/effective_care.csv /user/w205/hospital_compare/effective_care
hdfs dfs -put /home/w205/downloads/hospital_clean/readmissions.csv /user/w205/hospital_compare/reasmission
hdfs dfs -put /home/w205/downloads/hospital_clean/measures.csv /user/w205/hospital_compare/measures
hdfs dfs -put /home/w205/downloads/hospital_clean/survey_responses.csv /user/w205/hospital_compare/survey
