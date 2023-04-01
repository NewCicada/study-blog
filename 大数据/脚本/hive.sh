#! /bin/bash 
 
hive -e "
	use hive库名;
	CREATE  TABLE CUSTOMER (
		CUSTKEY INT comment '',
		NAME string comment '',
		ADDRESS string comment '',
		NATIONKEY string comment '',
                PHONE string comment '',
                ACCTBAL string comment '',
                MKTSEGMENT string comment '',
		COMMENT string comment ''
	)
	comment 'customer表'
	ROW FORMAT DELIMITED 
	FIELDS TERMINATED BY '\001' 
	LINES TERMINATED BY '\n'
	STORED AS textfile
	TBLPROPERTIES(
		'transactional'='false'
	); 
"