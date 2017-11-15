
# 创建表

# 1：不能指定分隔符，默认是 '\001' 分隔
create table table_name 
	as
select * from old_table

# 2：可以指定分隔符FIELDS TERMINATED BY '\t'
create table if not exists table_name(
                                      key_name        string
                                     ,key_id          string
                                      )
ROW FORMAT DELIMITED        --设置加载数据时支持的列分隔符
FIELDS TERMINATED BY '\t'
STORED as TEXTFILE                 --文本型数据


# 针对上述两种不同的创建表方式
# 第二种方法可以在创建表的时候指定具体的分隔符，
# 第一种方法可以在创建 表之后再修改分隔符，如下所示

--修改分隔符，以 '\t' 分隔
alter table table_name set SERDEPROPERTIES('field.delim'='\t');
