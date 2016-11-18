POL_HOME=/opt/playonlinux5
CLASSPATH=${CLASSPATH}:$POL_HOME/lib/*

# Ensure we are using the right java env
# Don't necessarily force default Java 8, as it is not the default for Arch Linux right now
# This handles users with Java 7 and 8
export PATH=/usr/lib/jvm/java-8-openjdk/jre/bin/:$PATH

java -classpath "$CLASSPATH" com.playonlinux.app.PlayOnLinuxApp "$@"

# Unset 
