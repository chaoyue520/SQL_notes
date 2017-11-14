#复制Hive表数据到一张新表(备份)

##### 方法 1：速度快

drop table if exists backups_table;
create table if not exists backups_table
	as 
select * from table_name where xxx


##### 方法 2：速度非常慢
hive -e "SQL line" > xxx.txt

# overwrite into表示覆盖
# into 表示追加
hive -e "load data local inpath './update_wallet_riskcontrol_dd_2017_11_13.txt' into table test.ods_wallet_riskcontrol_dd_subset ; "


##### 方法 3：速度比较慢

# 创建一张相同表结构数据
create table backups_table like old_table;

# 把 old_table 对应
hadoop fs -cp afs://xxx.db/old_table/*  afs://xxx.db/backups_table/


