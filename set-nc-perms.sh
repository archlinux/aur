#!/usr/bin/env bash
# from https://doc.owncloud.org/server/9.0/admin_manual/installation/installation_wizard.html#strong-perms-label
# run with the argument "runtime" to set the proper runtime permissions
# run with the argument "upgrade" to set the proper upgrade permissions

ncpath='/usr/share/webapps/nextcloud'
htuser='http'
htgroup='http'
rootuser='root'

runtime() {
  printf "Creating possible missing Directories\n"
  mkdir -p $ncpath/data
  mkdir -p $ncpath/assets
  mkdir -p $ncpath/updater

  printf "chmod Files and Directories\n"
  find ${ncpath}/ -type f -print0 | xargs -0 chmod 0640
  find ${ncpath}/ -type d -print0 | xargs -0 chmod 0750

  printf "chown Directories\n"
  chown -R ${rootuser}:${htgroup} ${ncpath}/
  chown -R ${htuser}:${htgroup} ${ncpath}/apps/
  chown -R ${htuser}:${htgroup} ${ncpath}/assets/
  chown -R ${htuser}:${htgroup} ${ncpath}/config/
  chown -R ${htuser}:${htgroup} ${ncpath}/data/
  chown -R ${htuser}:${htgroup} ${ncpath}/themes/
  chown -R ${htuser}:${htgroup} ${ncpath}/updater/

  chmod +x ${ncpath}/ncc

  printf "chmod/chown .htaccess\n"
  if [ -f ${ncpath}/.htaccess ]
   then
    chmod 0664 ${ncpath}/.htaccess
    chown ${rootuser}:${htgroup} ${ncpath}/.htaccess
  fi
  if [ -f ${ncpath}/data/.htaccess ]
   then
    chmod 0664 ${ncpath}/data/.htaccess
    chown ${rootuser}:${htgroup} ${ncpath}/data/.htaccess
  fi

  printf "chmod/chown .user.ini\n"
  if [ -f ${ncpath}/.user.ini ]
   then
    chmod 0664 ${ncpath}/.user.ini
    chown ${rootuser}:${htgroup} ${ncpath}/.htaccess
  fi
}

upgrade() {
  printf "Setting upgrade permissions\n"
  chown -R ${htuser}:${htgroup} ${ncpath}
}

$1
