#!/bin/sh
YACY_HOME=/usr/share/yacy
JAVA_ARGS="-server -Xss256k -XX:MaxPermSize=256m -XX:ReservedCodeCacheSize=1024m -XX:+UseConcMarkSweepGC -XX:+CMSIncrementalMode -XX:-UseGCOverheadLimit -XX:+UseAdaptiveSizePolicy -Djava.net.preferIPv4Stack=true -Djava.awt.headless=true -Dfile.encoding=UTF-8"
#check if system supports large memory pages and enable it if possible
HUGEPAGESTOTAL="$(cat /proc/meminfo | grep HugePages_Total | sed s/[^0-9]//g)"
if [ -n "$HUGEPAGESTOTAL" ] && [ $HUGEPAGESTOTAL -ne 0 ]
then 
	JAVA_ARGS="$JAVA_ARGS -XX:+UseLargePages"
fi

[ -f /etc/profile.d/jre.sh ] && . /etc/profile.d/jre.sh

[ -f /etc/conf.d/yacy ] && . /etc/conf.d/yacy

if [ "$(id -u)" != "0" -a "$(whoami)" != "$USER" ] ; then
	echo "please run this script as root!"
	exit 4
fi

JAVA=$(which java 2> /dev/null)
if [ ! -x "$JAVA" ]; then
	echo "The 'java' command is not executable."
	echo "Either you have not installed java or it is not in your PATH"
	if [ $1 == "stop" -a $2 == "--force" ]; then exit 0; else exit 1; fi
fi

cd $YACY_HOME

#get javastart args
if [ -s DATA/SETTINGS/yacy.conf ]
then
	# startup memory
	for i in Xmx Xms; do
		j=$(grep javastart_$i DATA/SETTINGS/yacy.conf | sed 's/^[^=]*=//')
		if [ -n $j ]; then JAVA_ARGS="-$j $JAVA_ARGS"
		fi
	done

	# Priority
	j=$(grep javastart_priority DATA/SETTINGS/yacy.conf | sed 's/^[^=]*=//')

	if [ ! -z "$j" ];
	then
		if [ -n $j ]
		then NICE_VAL=$j
		fi
	fi

else
	JAVA_ARGS="-Xmx120m -Xms120m $JAVA_ARGS"
fi


CP=/usr/share/java/yacy.jar:$YACY_HOME/htroot
for name in /usr/share/java/yacy/*.jar; do
	CP=$CP:$name
done
CLASSPATH=$CP

case "$1" in
	start)
		printf "Starting YaCy Daemon\n"
		ARGS="$JAVA_ARGS -classpath $CLASSPATH net.yacy.yacy"
		$JAVA $ARGS
		;;
	stop)
		$JAVA $JAVA_ARGS -cp $CLASSPATH net.yacy.yacy -shutdown
		;;
	restart)
		$0 stop
		sleep 3
		$0 start
		;;
esac
