awk -F"," 
'{
      rclick[$3","$5]+=1
  }
  {
      if($8==1)click[$3","$5]+=1;
      cuvall[$3","$5"_"$6]+=1
  }
  
  END
  {
  
      for (k in cuvall)
      {
          split(k,arr,"_"); 
          cuv[arr[1]]++;
      }  
          for (a in rclick) 
            print a, rclick[a], click[a], cuv[a]
}
' /data/webroot/ios/1*logs/ios/click/click.log.2013-10-06-*
