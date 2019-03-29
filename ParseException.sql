
# 以下会报错 : FAILED: ParseException line 5:47 extraneous input 't2' expecting EOF near '<EOF>'
select count(distinct t2.phone)
from 
((select phone 
from active_data_set 
where dt>='20181001' and dt<='20181031') t1 )  t2 


# 用下述同样能达到上边的统计效果, 不会报错
select count(distinct t2.phone)
from 
(select * from active_data_set where dt>='20181001' and dt<='20181031')  t2 

