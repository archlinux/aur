if [ $LD_LIBRARY_PATH ] 
then 
  if ! set | grep LD_LIBRARY_PATH | grep /usr/lib32/catalystpxp/ > /dev/null 
  then 
    LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib32/catalystpxp/
    export LD_LIBRARY_PATH
  fi  
else 
  LD_LIBRARY_PATH=/usr/lib32/catalystpxp/
  export LD_LIBRARY_PATH
fi 