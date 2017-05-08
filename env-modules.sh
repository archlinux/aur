
# init module enviroment

shell=$(/bin/basename $(/bin/ps -p $$ -ocomm=))

if [ -f /usr/Modules/init/$shell ]; then
   source /usr/Modules/init/$shell
else
   source /usr/Modules/init/sh
fi

