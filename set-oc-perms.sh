#!/usr/bin/env bash
# from https://doc.owncloud.org/server/9.0/admin_manual/installation/installation_wizard.html#strong-perms-label
# run with the argument "runtime" to set the proper runtime permissions
# run with the argument "upgrade" to set the proper upgrade permissions

ocpath='/usr/share/webapps/owncloud'
htuser='http'
htgroup='http'
rootuser='root'

runtime() {
  printf "Creating possible missing Directories\n"
  mkdir -p $ocpath/data
  mkdir -p $ocpath/assets
  mkdir -p $ocpath/updater

  printf "chmod Files and Directories\n"
  find ${ocpath}/ -type f -print0 | xargs -0 chmod 0640
  find ${ocpath}/ -type d -print0 | xargs -0 chmod 0750

  printf "chown Directories\n"
  chown -R ${rootuser}:${htgroup} ${ocpath}/
  chown -R ${htuser}:${htgroup} ${ocpath}/apps/
  chown -R ${htuser}:${htgroup} ${ocpath}/assets/
  chown -R ${htuser}:${htgroup} ${ocpath}/config/
  chown -R ${htuser}:${htgroup} ${ocpath}/data/
  chown -R ${htuser}:${htgroup} ${ocpath}/themes/
  chown -R ${htuser}:${htgroup} ${ocpath}/updater/

  chmod +x ${ocpath}/occ

  printf "chmod/chown .htaccess\n"
  if [ -f ${ocpath}/.htaccess ]
   then
    chmod 0644 ${ocpath}/.htaccess
    chown ${rootuser}:${htgroup} ${ocpath}/.htaccess
  fi
  if [ -f ${ocpath}/data/.htaccess ]
   then
    chmod 0644 ${ocpath}/data/.htaccess
    chown ${rootuser}:${htgroup} ${ocpath}/data/.htaccess
  fi
}

upgrade() {
  printf "Setting upgrade permissions\n"
  chown -R ${htuser}:${htgroup} ${ocpath}
}

$1
