#!/bin/bash
# Created by Max Devaine <maxdevaine@gmail.com>
# Last update : 7.7.2014

PATH=/sbin:/bin:/usr/sbin:/usr/bin:/opt/java/jre/bin
FLEXIBEE_PID=/var/run/flexibee.pid
FLEXIBEE_USER="flexibee"
MYLANG=`echo $LANG | cut -c 1-2`
CONFIGFILE=/etc/flexibee/flexibee-server.xml
DEFAULTCONFIGFILE=/etc/default/flexibee

case "$1" in
	start)

### detect flexibee default configuration file		
if [ -f /etc/default/flexibee ]; then
   . /etc/default/flexibee
fi

### detect flexibee server mode (if is define)
if [ x"$DEFAULTCONFIGFILE" = x"client" ]; then

    if [ x"$MYLANG" = x"cs" ]; then
        echo "FlexiBee je vypnutý. Změňte hodnotu FLEXIBEE_CFG z 'client' na 'local' nebo 'server' v /etc/default/flexibee"
      else 
	echo "FlexiBee is disabled. Change FLEXIBEE_CFG from 'client' to 'local' or 'server' in /etc/default/flexibee"
    fi
    exit 0
fi


### detect postgresql server runing
if [ ! 'systemctl status postgresql' ]; then

    if [ x"$MYLANG" = x"cs" ]; then
        echo "Neběží postgresql databáze. Spusťte jí pomocí : systemctl start postgresql"
          else
	    echo "Postgresql database not running, run the database : systemctl start postgresql "
    fi
    exit 0
fi


### detect flexibee running
          if [ -e $FLEXIBEE_PID ]; then

            if [ x"$MYLANG" = x"cs" ]; then
             echo "Flexibee server je už spuštěn!"
             else
	       echo "Flexibee server is running!"
            fi
             exit 0
          fi

### run flexibee server
        /usr/sbin/flexibee-server

### detect running flexibee server
          if [ -e $FLEXIBEE_PID ]; then

            if [ x"$MYLANG" = x"cs" ]; then
               echo "Flexibee server byl úspěšně spuštěn."
             else
	       echo "Flexibee server successfully started"
            fi
            exit 0
          else
            if [ x"$MYLANG" = x"cs" ]; then
               echo "Chyba při spouštění flexibee serveru!"
             else
	       echo "Error when starting flexibee server!"
            fi

          fi
         

		;;
	stop)

          if [ ! -e $FLEXIBEE_PID ]; then

            if [ x"$MYLANG" = x"cs" ]; then
             echo "Chyba : Flexibee server není spuštěn."
             else
	       echo "Error : Flexibee server is not running"
            fi
             exit 0
          fi

          kill `cat $FLEXIBEE_PID`
          rm -f $FLEXIBEE_PID           

		;;
	restart)
		$0 stop
		sleep 2
		$0 start
		;;
	install)

           echo "---> 1) Create system user and group : flexibee"
           echo "     useradd --system --home-dir /tmp --no-create-home --user-group --shell /bin/false flexibee"
           useradd --system --home-dir /tmp --no-create-home --user-group --shell /bin/false flexibee

           echo "---> 2) Create database role with random secret password : "
           echo "     su - postgres -c CREATE ROLE dba PASSWORD '********' CREATEDB SUPERUSER CREATEROLE INHERIT LOGIN;"

           ### generate random password
           pass=`</dev/urandom tr -dc A-Za-z0-9| (head -c $1 > /dev/null 2>&1 || head -c 23)`

           ### create database role
           su - postgres -c "psql -c \"CREATE ROLE dba PASSWORD '$pass' CREATEDB SUPERUSER CREATEROLE INHERIT LOGIN;\""


           echo "---> 3) The database role password adding to flexibee configuration file $CONFIGFILE"
           echo "     cat $CONFIGFILE | sed '/password/s/7971/**********/g' > $CONFIGFILE.new"
           echo "     mv $CONFIGFILE.new $CONFIGFILE"
	   cat $CONFIGFILE | sed '/password/s/7971/'$pass'/g' > $CONFIGFILE.new
           mv $CONFIGFILE.new $CONFIGFILE
           pass=0

           echo "---> 4) Change file permission to flexibee configuration file"
           echo "     chmod 600 $CONFIGFILE"
           echo "     chown flexibee $CONFIGFILE"
           chmod 600 $CONFIGFILE
           chown flexibee $CONFIGFILE


		;;
	*)
		echo "usage: $0 {start|stop|restart|install}"
esac
exit 0

