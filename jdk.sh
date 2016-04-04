JAVA_HOME=/opt/java
export JAVA_HOME

PATH=$PATH:$JAVA_HOME/bin
export PATH

JAVA_OPTS="-Dfile.encoding=UTF-8 -Xms1024M -XX:MaxPermSize=2048M -Xmx4096M -XX:+DisableExplicitGC"
export JAVA_OPTS
