awk -F',' 
'{
      rclick[$4","$6]+=1; 
      if($9==1){
          click[$4","$6]+=1;
          cuvall[$4","$6"_"$7]+=1;
      }
      else if ($9!=1)
      {
          click[$4","$6]+=0;
          cuvall[$4","$6"_"$7]+=0;
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
            print a, rclick[a], click[a], cuv[a] #print result
}' $INPUT_FILE
$INPUT_FILE=/home/dev/hantest/click_log*/click.log.2013-10-15-*new_withnewcityip > /home/dev/adv_daily_data/2013-10-15.android.click.txt

#show
awk -F',' 
'{
      rclick[$4","$6]+=1;
      cuvall[$4","$6"_"$7]+=1
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
$INPUT_FILE=/home/dev/hantest/show_log*/show.log.2013-10-15-*new_withnewcityip > /home/dev/adv_daily_data/2013-10-15.android.show.txt
~                
