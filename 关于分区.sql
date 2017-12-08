
# 创建分区表
create table if not exists jxj_y_tag(
                                      bid    string    comment 'passid'
                                    , y_tag  string    comment '其他'
    )
PARTITIONED BY (dt string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
STORED as TEXTFILE;



# 导入数据到指定分区
LOAD DATA LOCAL INPATH './y_tag_20171206.txt' INTO TABLE test PARTITION(dt='20171206')


# 删除分区数据
ALTER TABLE test DROP partition(dt='20171207');