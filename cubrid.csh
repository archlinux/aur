setenv CUBRID /opt/cubrid
setenv CUBRID_DATABASES /var/lib/cubrid/databases
if (${?LD_LIBRARY_PATH}) then
  setenv LD_LIBRARY_PATH $CUBRID/lib:${LD_LIBRARY_PATH}
else
  setenv LD_LIBRARY_PATH $CUBRID/lib
endif
setenv SHLIB_PATH $LD_LIBRARY_PATH
setenv LIBPATH $LD_LIBRARY_PATH
set path=($CUBRID/bin $path)
