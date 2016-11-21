instruction to run for ex2
dan wald

1)	on aws, mount drive if necessary
a.	mount -t ext4 /dev/xvdf /data
2)	make sure packages are installed
a.	pip install psycopg2
b.	pip install tweepy
3)	login to postgres
a.	/data/start_postgres.sh
4)	change user to w205 for best practice
a.	su – w205
5)	start a folder directory for postgres in your desired location
a.	sparse quickstart extweetwordcount
6)	clone the git directory 
a.	git clone https://github.com/dswald/w205_wald.git
b.	git checkout -b hw_dev
c.	git pull origin hw_dev
7)	navigate to the git repository ./w205/ex2/ex2tweetwordcount/topologies
a.	remove file “ex2tweetwordcount.clj” if it exists
8)	navigate to git repository ./w205/ex2/ex2tweetwordcount/
a.	sparse run #streaming data
b.	wait for a while to populate data
9)	tools exploration:
a.	all tools are at to top level of ./w205/ex2/ex2tweetwordcount/
b.	you need to look at the following files in addition to the twitter storm applications:
i.	finalresults.py
ii.	histogram.py
iii.	barchart.py 
1.	# note that plotting within python 2 is disabled, so i copied this code over to a jupyter notebook running python 3, populating the data with most_used = records[-1:-21:-1]
10)	screenshots are located within ./w205/ex2/ex2tweetwordcount/
