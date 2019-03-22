--row_number()

select bb.* from
(
select aa.*,row_number() over(partition by aa.phone,aa.dt order by aa.phone ) rank from
(
select a.cookie,b.phone,a.dt,d.plate_num,d.data_src
from
(select  cookie,dt
from gdm.gdm_02_pv_basic_di
where dt>='2018-11-01' and dt<='2019-01-31'
and event_id='car_calculator_result_page_big_bang_pv' -------计算车险计算器流量
)a
left join
(select cookie,phone
 from mds.mds_usr_cookie_phone_rela_his
 where dt='2019-02-01' and phone is not null
)b on a.cookie=b.cookie
left join (select  user_id,phone from gdm.gdm_01_user_base_info_da where dt='2019-03-04')c on b.phone=c.phone
left join (select * from gdm.gdm_01_user_platenum_mapping_da where dt='2019-03-04' and plate_num is not null ) d on c.user_id=d.user_id

) aa ) bb where rank=1;