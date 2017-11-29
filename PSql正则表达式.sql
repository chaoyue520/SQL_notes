
### 需求背景1: 拆分key值scoringLabel对应的所有value

{"flowRandom":[1,2,3],
"violateTreePath":["sync_pay","syncpayroot","charge_634"],
"scoringLabel":{"sheep_account":1,"feed_on_account":5},
"treeNodeCodeList":["charge_634","otherspay"]}

### 实现过程
select event_json_ext
,substring(event_json_ext from 'scoringLabel\":{(.*?)(})')
,replace(substring(event_json_ext from 'scoringLabel\":{(.*?)(})'),'"','')
,regexp_split_to_table(replace(substring(event_json_ext from 'scoringLabel":{(.*?)(})'),'"',''),',')
,split_part(regexp_split_to_table(replace(substring(event_json_ext from 'scoringLabel\":{(.*?)(})'),'"',''),','),':',2)
from test_name


### 需求背景2: 拆分key值mac对应的所有value

[{"mac":"e4:aa:5d:4b:f6:01","rssi":-53,"ssid":"Baidu_WiFi"}
,{"mac":"e4:aa:5d:57:c9:f3","rssi":-78,"ssid":""}
,{"mac":"e4:aa:5d:4b:f6:0c","rssi":-62,"ssid":""}
,{"mac":"e4:aa:5d:4b:f6:03","rssi":-52,"ssid":""}
,{"mac":"e4:aa:5d:57:c9:f1","rssi":-74,"ssid":"Baidu_WiFi"}]

### 实现过程
select transaction_id,occur_date,prcid,transaction_type,event_type,bid,producttype
      ,replace(substring(regexp_split_to_table(wifiFinger,'}') from 'mac\":\"(.*?)(\")'),' ','') as wifi_list
from yangkunqian.ods_credit_riskcontrol_dd 
where occur_date>='20170701' and transaction_id is not null and transaction_id !='-9999'



###总结： 函数（）
-- substring：正则匹配，先把scoringLabel的所有value拿出来
-- replace：简单替换掉双引号
-- regexp_split_to_table：把单行变成多行，按照逗号分隔
-- split_part：按照冒号分隔字符串，并分别取出第一个位置的值和第二个位置的值

