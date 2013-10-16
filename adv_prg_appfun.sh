#click
awk -F',' 
'{
      rclick[$4","$6]+=1; 
      if($9==1||$9==0)
      {
            click[$4","$6]+=1;
            cuvall[$4","$6"_"$7]+=1;
      }
      else
      {
            cuvall[$4","$6"_"$7]+=0;
            click[$4","$6]+=0;
      }
 }
 END
 {
      for(k in cuvall)
      {
          if(cuvall[k]>0)
          {
                split(k,arr,"_"); 
                cuv[arr[1]]+=1;
          }
          else
          {
                split(k,arr,"_"); 
                cuv[arr[1]]+=0;
          }
      } 
      for(a in rclick) 
            print a, rclick[a], click[a], cuv[a]
}' $INPUT_FILE
$INPUT_FILE=/home/dev/hantest/ios_fsclick_log*/click.log.2013-10-13-*new_withnewcityip > /home/dev/adv_daily_data/2013-10-13.appfun.click.txt

#show
awk -F',' 
'{
        rclick[$4","$6]+=1;
        cuvall[$4","$6"_"$7]+=1;
  }
  END
  {
        for(k in cuvall)
        {
              split(k,arr,"_"); 
              cuv[arr[1]]++;
        }  
        for(a in rclick) 
            print a, rclick[a], cuv[a]
}' $INPUT_FILE
$INPUT_FILE=/home/dev/hantest/ios_fsshow_log*/show.log.2013-10-13-*new_withnewcityip > /home/dev/adv_daily_data/2013-10
-13.appfun.show.txt
