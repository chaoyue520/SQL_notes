

create table if not exists test_1206(   
      bid string
    , usedAmount  int
    , usedAmount1    bigint
    , usedAmount2    string
    , usedAmount3    double)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY '\t'
STORED as TEXTFILE;


SELECT bid 
       ,sum(CASE WHEN loan_status in ('2','3') then inst_total_amount else '0' end) as usedAmount
       ,sum(CASE WHEN loan_status in ('2','3') then inst_total_amount else '0' end) as usedAmount1
       ,sum(CASE WHEN loan_status in ('2','3') then inst_total_amount else '0' end) as usedAmount2
       ,sum(CASE WHEN loan_status in ('2','3') then inst_total_amount else '0' end) as usedAmount3
   FROM test
   WHERE dt = '20171205'
   GROUP BY bid
   limit 1000

```
注意事项：
1：usedAmount在被计算出来的时候，是double型的，如果在创建表的时候定义成int或者bigint型，在导入数据的
   时候会被强制转化为NULL值。如果创建表的时候定义为double或者string型则不会被转化为NULL值，但是在用string型
   的时候，比大小可能会有问题

```
