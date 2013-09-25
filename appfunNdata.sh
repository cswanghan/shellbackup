#!/bin/bash
# 对变量赋值：
cmdpath="/home/dev/hive-0.9.0-bin/bin/hive -e"

outdate=$(date -d "yesterday" +"%m%d")

a=2013-$(date -d "yesterday" +"%m-%d")  #等号两边均不能有空格存在
advnplusdata="insert overwrite table dailyinfo select * from (select ad_id, udid, concat(dt,' ',hour,':',time_minute,'.',time_second), 'show' from ios_show_log where dt = '2013-$(date -d "yesterday" +"%m-%d")' union all select ad_id, udid, concat(dt,' ',hour,':',time_minute,'.',time_second), 'click' from ios_click_log where dt = '2013-$(date -d "yesterday" +"%m-%d")')temp"

dailyinfo='"select ad_id, udid, dt, type from dailyinfo order by dt"'
dailyinfo2="> /home/dev/wanghan/2013-$(date -d "yesterday" +"%m-%d")dailyinfo"

awkcmd="awk -F' ' '{print \$1\",\"\$2\",\"\$3\" \"\$4\",\"\$5}' /home/dev/wanghan/2013-$(date -d "yesterday" +"%m-%d")dailyinfo"
awkout="> /home/dev/wanghan/2013-$(date -d "yesterday" +"%m-%d")dailyinforeformat"

finalcmd="java -jar GenerateAdvNDataUpdate.jar 2013-$(date -d "yesterday" +"%m-%d") /home/dev/wanghan/2013-$(date -d "yesterday" +"%m-%d")dailyinforeformat"

# 打印变量a的值：
#echo  $cmdpath \"$advnplusdata\" >> advnplusdata$outdate.sh
#echo  >> advnplusdata$outdate.sh
#echo  $cmdpath $dailyinfo $dailyinfo2 >> advnplusdata$outdate.sh
#echo  >> advnplusdata$outdate.sh
#echo  $awkcmd $awkout >> advnplusdata$outdate.sh
#echo  >> advnplusdata$outdate.sh
#echo  $finalcmd >> advnplusdata$outdate.sh

advShowNdata="insert overwrite table adv_n_show_data select ad_id, udid, count(udid) from ios_fsshow_log where dt = '2013-$(date -d "yesterday" +"%m-%d")' group by ad_id, udid"
advClickNdata="insert overwrite table adv_n_click_data select ad_id, udid, count(udid) from ios_fsclick_log where dt = '2013-$(date -d "yesterday" +"%m-%d")' group by ad_id, udid"

echo $cmdpath \"$advShowNdata\" >> appfun_advNdata$(date -d "yesterday" +"%m%d").sh
echo >> appfun_advNdata$(date -d "yesterday" +"%m%d").sh
echo $cmdpath \"$advClickNdata\" >> appfun_advNdata$(date -d "yesterday" +"%m%d").sh

