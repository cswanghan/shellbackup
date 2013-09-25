#!/bin/bash
# 对变量赋值：
cmdpath="/home/dev/hive-0.9.0-bin/bin/hive -e"
# 打印变量a的值：
#echo  $cmdpath \"$advnplusdata\" >> advnplusdata$outdate.sh
#echo  >> advnplusdata$outdate.sh
#echo  $cmdpath $dailyinfo $dailyinfo2 >> advnplusdata$outdate.sh
#echo  >> advnplusdata$outdate.sh
#echo  $awkcmd $awkout >> advnplusdata$outdate.sh
#echo  >> advnplusdata$outdate.sh
#echo  $finalcmd >> advnplusdata$outdate.sh

advShowNdata="insert overwrite table adv_n_show_data select * from (select ad_id, udid, count(udid) from ios_show_log where dt = '2013-$(date -d "yesterday" +"%m-%d")' group by ad_id, udid union all select ad_id, udid, count(udid) from show_log where dt = '2013-$(date -d "yesterday" +"%m-%d")' and ad_id is not null and udid is not null group by ad_id, udid) temp"
advClickNdata="insert overwrite table adv_n_click_data select * from (select ad_id, udid, count(udid) from ios_click_log where dt = '2013-$(date -d "yesterday" +"%m-%d")' group by ad_id, udid union all select ad_id, udid, count(udid) from click_log where dt = '2013-$(date -d "yesterday" +"%m-%d")' and ad_id is not null and udid is not null group by ad_id, udid) temp"

echo $cmdpath \"$advShowNdata\" >> advNdata$(date -d "yesterday" +"%m%d").sh
echo >> advNdata$(date -d "yesterday" +"%m%d").sh
echo $cmdpath \"$advClickNdata\" >> advNdata$(date -d "yesterday" +"%m%d").sh
