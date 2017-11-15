
-- hivesql在order by 的时候如果不加limit限制，会报错
-- FAILED: Error in semantic analysis: Line 1:78 In strict mode, if ORDER BY is specified, LIMIT must also be specified dt

-- 正确写法
select dt,count(*) 
from ods_wallet_riskcontrol_dd_subset 
group by dt 
order by dt desc 
limit 10000;  --注意limit后的数字可任意设置