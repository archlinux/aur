#! /usr/bin/env sh

if [ $(id -u) -ne 0 ]; then
    printf "You need to be root\n"
    exit 1
fi

## Migration needs PostgreSQL + redis running.
## Don't migrate if not running
if /usr/bin/systemctl is-active postgresql.service > /dev/null \
  && /usr/bin/systemctl is-active redis.service > /dev/null; then 
    ## misskey needs to be stopped, check for this
    if /usr/bin/systemctl is-active misskey.service; then
      printf "Shutting down misskey\n"
      MK_ACTIVE=1
      /usr/bin/systemctl stop misskey.service
    fi
    printf "Migrate data to new version\n"
    cd "/usr/share/webapps/misskey/"
    /usr/bin/runuser -u misskey -- env HOME="/usr/share/webapps/misskey" yarn migrate
    if ! [ -z ${MK_ACTIVE+x} ] ; then
        printf "starting up misskey\n"
        /usr/bin/systemctl start misskey.service
    else
        printf "Misskey service is *not* started\n"
        printf "Thats your job!\n"
    fi
else
    printf "Misskey migration was not started because PostgreSQL and or redis is inactive.\n"
    printf "Please start the services and run\n"
    printf "# /usr/lib/misskey/misskey-db-upgrade.sh\n"
fi
