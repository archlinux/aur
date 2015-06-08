if [ $LD_LIBRARY_PATH ] 
then 
  if ! set | grep LD_LIBRARY_PATH | grep /usr/lib/catalystpxp/ > /dev/null 
  then 
    LD_LIBRARY_PATH=/usr/lib/catalystpxp/:$LD_LIBRARY_PATH
    export LD_LIBRARY_PATH
  fi  
else 
  LD_LIBRARY_PATH=/usr/lib/catalystpxp/
  export LD_LIBRARY_PATH
fi 