setenv JIOHOME $JAVA_HOME/lib
setenv CLASSPATH $JIOHOME/jai_imageio.jar:$JIOHOME/clibwrapper_jiio.jar:$CLASSPATH
setenv LD_LIBRARY_PATH .:$LD_LIBRARY_PATH:$JIOHOME
