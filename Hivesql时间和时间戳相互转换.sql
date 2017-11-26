# 时间 与 时间戳 相互转化
unix_timestamp()
from_unixtime()

# 举个栗子：'20170529215456'

# 如此类型时间转时间戳
select dt,unix_timestamp(dt,'yyyyMMddHHmmss') from test_table 

# 时间戳再转时间
select dt,from_unixtime(unix_timestamp(dt,'yyyyMMddHHmmss'),'yyyy-MM-dd') from test_table 



