
# 换行符的ASCII码等于 10
select remarks,replace(remarks,CHR(10),',') 
from test_table
