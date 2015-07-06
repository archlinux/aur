#!/bin/sh
# Packagers can change this to dash

# TODO: Fix magic. I don't see where magic is used anywhere.
# TODO: Fix trusted-users (mail)

# This was adapted from the RPM .spec. The .spec forced an organization which 
# the *-install.sh files lacked. RPM used some bashisms that were removed.

# The Hylafax scripts are very classy work. I'll try to duplicate some of that 
# class here.
# The Basis Pro/5 scripts were even classier, all as functions so they can be 
# thrown together in any order.

# This script is designed so you can run the desired parts over and over 
# until all the steps complete properly. This is part of the rigor required 
# to function well in the fast upgrade environment of Arch Linux.

# All vars and functions start with _ so this can be directly run from 
# Arch Linux PKGBUILD.

# /etc/avantfaxrpm.conf

# To make these vars more friendly for sed hacking always use "double" quotes 
# and do not put # comments on the end of lines (like this one). # don't do this! # or this!
# AUTO_START_HTTP isn't (yet) used in this file but it may be used by files 
# that source this. It will likely be used when this script is adapted 
# for platforms other than Arch Linux.
_opt_AUTO_START_HTTP=0
_opt_WWWUSER="http"
_opt_WWWGROUP="http"
_opt_HYLA_GROUP="uucp"
_opt_AVANTFAX_SERVERNAME="avantfax"
_opt_HTTP_DIR="/srv/http"
_opt_HYLA_BIN_DIR="/usr/bin"
# reboot, halt, # I'm not the only one who thinks that this is a bad idea.
_opt_SUDO_LINE="${_opt_WWWUSER} ALL = NOPASSWD: ${_opt_HYLA_BIN_DIR}/faxdeluser, ${_opt_HYLA_BIN_DIR}/faxadduser"
_opt_AVANT_CMTTAG="##AvantFAX##"

if [ ! -z "${_opt_SOURCEONLY}" ]; then
  return 0
fi
# We can't set -u before here or we might change the setting for our sourcer
if [ -z "${_opt_DESTDIR}" ]; then
  _opt_DESTDIR="${_opt_DESTDIR}"
fi
set -u

if [ "`id -u`" -ne 0 ]; then # $EUID is a bashism
  echo "`basename "$0"`: Must run as root"
  exit 1
fi

_opt_INST_DIR="${_opt_HTTP_DIR}/${_opt_AVANTFAX_SERVERNAME}"
_opt_BIN_DIR="${_opt_HTTP_DIR}/${_opt_AVANTFAX_SERVERNAME}-bin"
# These are the database settings AvantFAX will create and use
_opt_ADFB_USER="avantfax"
# ADFB_NAME used to be called DB. 2 character variables or variables likely 
# to be in the persistent shell environment are unwise!
_opt_AFDB_NAME="avantfax"
# The MariaDB service is still called mysqld
_opt_MYSQLD="mysqld"
# friendly name for server
_opt_SQL_FR="MariaDB"
_opt_MYSQLADMIN="mysqladmin"
_opt_MYSQL="mysql"
_opt_MYSQLDUMP="mysqldump"
_opt_FAXRMPWD="pwd"
_opt_HYLASPOOL="/var/spool/hylafax"
# "" for autodetect, 0 for SysV, 1 for systemd
_opt_SYSTEMD=
_opt_SERVICE="/sbin/service"
# You can sed this or use export _opt_DESTDIR="..."
#_opt_DESTDIR=
# _opt_BUILD is only an idea not implemented, but would be something like
# RPM, Debian, ArchLinux, or any other value that can be used to adapt this
# script to many platforms. Someday we'll get rid of the too many install scripts.
#_opt_BUILD=
_opt_VHOSTS=1

if [ -z "${_opt_DESTDIR}" ]; then
  if [ ! -s "$0.password" ]; then
    cat >> "$0.password" << EOF
# The MySQL/MariaDB root password must be placed here for AvantFAX. This file
# can only be read by root and the password isn't stored anywhere else. The
# password is only used at install and remove to add or remove user avantfax.
# All normal operations are done with the avantfax user and the password below.
_opt_ROOTMYSQLPWD=""

# The MySQL avantfax user password is placed here to make it persistent
# between upgrades. This password is transferred to the php config script so
# would be revealed by any hacker that can get to the php script. The purpose
# is to ensure that every AvantFAX install has a random password to minimize
# the possibility of a widespread AvantFAX hack if http, php, or mysql
# vulnerabilities lead to non root access to MySQL.
_opt_ADFB_PASS="`dd if=/dev/urandom bs=1 count=32 2>/dev/null | base64 -w 0 | rev | cut -b 2- | rev`"

# When you are done configuring this run:
# avantfaxsetup.sh install
EOF
    chown 'root:root' "$0.password" # just to make sure
    chmod 600 "$0.password"
  fi
  . "$0.password"
fi

if [ -z "${_opt_SYSTEMD}" ]; then
  if command -v systemctl >/dev/null 2>&1; then
    _opt_SYSTEMD=1
  else
    _opt_SYSTEMD=0
  fi
fi

if grep -i 'adv''ant' "$0"; then
  echo "It's AvantFax, not Adv""antFAX. Please fix the script!"
  exit 1
fi

# These parts can be done in the package build, the preferred place for chmod.
_fn_setup_package() {
  chmod -R 0770 "${_opt_DESTDIR}${_opt_INST_DIR}/tmp" "${_opt_DESTDIR}${_opt_INST_DIR}/faxes"
####### SETUP SMARTY #######
  chmod 0770 \
      "${_opt_DESTDIR}${_opt_INST_DIR}/includes/templates/admin_theme/templates_c/" \
      "${_opt_DESTDIR}${_opt_INST_DIR}/includes/templates/admin_theme/cache/" \
      "${_opt_DESTDIR}${_opt_INST_DIR}/includes/templates/main_theme/templates_c/" \
      "${_opt_DESTDIR}${_opt_INST_DIR}/includes/templates/main_theme/cache/"
  chmod 0755 \
      "${_opt_DESTDIR}${_opt_INST_DIR}/includes/faxcover.php" \
      "${_opt_DESTDIR}${_opt_INST_DIR}/includes/faxrcvd.php" \
      "${_opt_DESTDIR}${_opt_INST_DIR}/includes/notify.php" \
      "${_opt_DESTDIR}${_opt_INST_DIR}/tools/update_contacts.php" \
      "${_opt_DESTDIR}${_opt_INST_DIR}/tools/faxcover.php" \
      "${_opt_DESTDIR}${_opt_INST_DIR}/includes/avantfaxcron.php" \
      "${_opt_DESTDIR}${_opt_INST_DIR}/includes/dynconf.php"
}

# This is called build because it is from the %build section of the RPM .spec.
# I prefer to chown in the installer where we get to use words, not the
# PKGBUILD where we can't adduser so we can't depend on anything more than numbers.
_fn_setup_build() {
##############################################################################################################
  chown -R "${_opt_WWWUSER}:${_opt_WWWGROUP}" "${_opt_INST_DIR}/"
  chown -R "${_opt_WWWUSER}:${_opt_HYLA_GROUP}" "${_opt_INST_DIR}/tmp" "${_opt_INST_DIR}/faxes"

####### SETUP SMARTY #######
  chown "${_opt_WWWUSER}:${_opt_WWWGROUP}" \
      "${_opt_INST_DIR}/includes/templates/admin_theme/templates_c/" \
      "${_opt_INST_DIR}/includes/templates/admin_theme/cache/" \
      "${_opt_INST_DIR}/includes/templates/main_theme/templates_c/" \
      "${_opt_INST_DIR}/includes/templates/main_theme/cache/"

  # open_basedir resolves soft links so we'll create hard links. This keeps us out of the /bin folder.
  install -d -m755 "${_opt_BIN_DIR}"
  # which would need to be tested with -x to eliminate not found executables
  for _var_i in 'html2ps' 'lpr' 'tesseract' 'fax2ps' 'faxinfo' 'faxstat' 'faxadduser' 'faxdeluser' 'faxgetty' 'sendfax' 'faxrm' 'faxalter'; do
    _var_file="`command -v ${_var_i}`"
    if [ ! -z "${_var_file}" ]; then
      ln -f "${_var_file}" "${_opt_BIN_DIR}/${_var_i}"
    fi
  done
}

_fn_check_mysql() {
  for _var_isthere in "${_opt_MYSQL}" "${_opt_MYSQLADMIN}"; do
    if ! command -v "${_var_isthere}" >/dev/null 2>&1; then
      echo "I require ${_var_isthere} but it's not installed."
      exit 1
    fi
  done # From graysky's zfs installer
}

# This is called pre because it's from the %pre section of the RPM .spec.
# It cannot be run at %pre. It is run at %post because of a race condition.
# Running at %pre is fine if mysql is already installed and configured.
# If AvantFAX and MySQL/MariaDB are installed at the same time (which is likely)
# this could execute before MySQL's install. Then with all the code trapped
# in the RPM .spec the user has no way to continue the install. All they
# can do is to uninstall and reinstall.
# $1 flag: 1 = install, 2 = upgrade
_fn_setup_pre() {
  if [ "$1" -eq 1 ]; then
    echo "### DB Settings: ${_opt_ADFB_USER} ${_opt_ADFB_PASS} ${_opt_AFDB_NAME} (root password)" # ${_opt_ROOTMYSQLPWD}"
  fi
  _fn_check_mysql

  if [ "${_opt_SYSTEMD}" -ne 0 ]; then
    systemctl -q is-active "${_opt_MYSQLD}.service"
  else
    ${_opt_SERVICE} "${_opt_MYSQLD}" status >/dev/null 2>&1
  fi
  _var_WAS_ACTIVE="$?"

  # If the admin had it stopped, we'll stop it when done.
  _fn_sql_deactivate() {
    if [ "${_var_WAS_ACTIVE}" -ne 0 ]; then
      if [ "${_opt_SYSTEMD}" -ne 0 ]; then
        systemctl stop "${_opt_MYSQLD}.service"
      else
        ${_opt_SERVICE} "${_opt_MYSQLD}" stop
      fi
    fi
  }

  _fn_sql_boom() { # clever function from Hylafax
    _fn_sql_deactivate
    echo "`basename "$0"`: Unable to configure ${_opt_SQL_FR}. Ensure it is configured and run `basename "$0"` again"
    echo "Problem: $1"
    exit 1
  }

  if [ "${_var_WAS_ACTIVE}" -ne 0 ]; then
    echo "##########################################################################"
    echo "### Temporairly Starting ${_opt_SQL_FR}"
    if [ "${_opt_SYSTEMD}" -ne 0 ]; then
      systemctl start "${_opt_MYSQLD}.service"
      if ! systemctl -q is-active "${_opt_MYSQLD}.service"; then
        _fn_sql_boom "Service didn't start"
      fi
    else
      ${_opt_SERVICE} "${_opt_MYSQLD}" start
      if ! ${_opt_SERVICE} "${_opt_MYSQLD}" status >/dev/null 2>&1; then
        _fn_sql_boom "Service didn't start"
      fi
    fi
  fi

  if [ "$1" -eq 1 ]; then
    echo "### Testing root access for ${_opt_SQL_FR}"
  fi
  _var_isthere="`${_opt_MYSQL} --user=root --password="${_opt_ROOTMYSQLPWD}" 'mysql' -sNe "select count(*) as existe from user where User = '${_opt_ADFB_USER}'"`"
  #echo "${_var_isthere}"
  if [ "$?" -ne 0 ]; then
    echo "sudo vi '$0.password' # enter your root password here."
    _fn_sql_boom "Is there a root password set for MySQL set in `basename "$0"`.password?"
  fi

  if [ "$1" -eq 1 ]; then
    _var_isthere="`${_opt_MYSQL} --user=root --password="${_opt_ROOTMYSQLPWD}" -sNe "SHOW DATABASES like '${_opt_AFDB_NAME}'"`"
    #echo "${_var_isthere}"
    if [ "$?" -ne 0 -o ! -z "${_var_isthere}" ]; then
      echo "### AvantFAX database ${_opt_AFDB_NAME} already exists"
    else
      echo "### Creating AvantFAX ${_opt_SQL_FR} database"
      ${_opt_MYSQLADMIN} --default-character-set=utf8 --user='root' --password="${_opt_ROOTMYSQLPWD}" create "${_opt_AFDB_NAME}"

      if [ "$?" -ne 0 ]; then
        _fn_sql_boom "Can't create ${_opt_ADFB_USER} user"
      fi
      echo "### Creating ${_opt_ADFB_USER} account with password ${_opt_ADFB_PASS} for DB ${_opt_AFDB_NAME}"
      ${_opt_MYSQL} --user='root' --password="${_opt_ROOTMYSQLPWD}" 'mysql' -e "GRANT ALL PRIVILEGES ON ${_opt_AFDB_NAME}.* TO '${_opt_ADFB_USER}'@'localhost' IDENTIFIED BY \"${_opt_ADFB_PASS}\""
      if [ "$?" -ne 0 ]; then
        _fn_sql_boom "Can't grant to ${_opt_ADFB_USER} user"
      fi
      echo "`basename "$0"`: SQL configuration complete."
    fi
  elif [ "$1" -eq 2 ]; then
    echo '### Backing up old AvantFAX into /root/avantfaxbackup'
    mkdir -p '/root/avantfaxbackup'
    ${_opt_MYSQLDUMP} --user="${_opt_ADFB_USER}" --password="${_opt_ADFB_PASS}" "${_opt_AFDB_NAME}" > '/root/avantfaxbackup/db_backup.sql'
    cp -pru "${_opt_INST_DIR}/includes/local_config.php" "${_opt_INST_DIR}/includes/config.php" "${_opt_INST_DIR}/faxes/" '/root/avantfaxbackup/'
  fi
  _fn_sql_deactivate
}

# Reload apache, but only if it's already loaded
_fn_reload_http() {
  echo '### Reloading http service'
  if [ "${_opt_SYSTEMD}" -ne 0 ]; then
     if systemctl -q is-active 'httpd.service'; then
      systemctl reload 'httpd.service'
    fi
  else
    if ${_opt_SERVICE} httpd status >/dev/null 2>&1; then
      ${_opt_SERVICE} httpd graceful
    fi
  fi
}

# $1 flag: 1 = install, 2 = upgrade
_fn_setup_post() {
  if [ "$1" -eq 1 ]; then
    echo "### DB Settings: ${_opt_ADFB_USER} ${_opt_ADFB_PASS} ${_opt_AFDB_NAME} (root password)" # ${_opt_ROOTMYSQLPWD}"
  fi
  _fn_check_mysql
  #echo "### DB Settings: ${_opt_ADFB_USER} ${_opt_ADFB_PASS} ${_opt_AFDB_NAME}" # ${_opt_ROOTMYSQLPWD}"
  for _var_i in '/etc/hylafax/hyla.conf' '/var/lib/hylafax/hfaxd.conf' '/usr/lib/fax/hfaxd.conf'; do
    if [ -f "${_var_i}" ]; then
      _var_HYLACONF="${_var_i}"
      break
    fi
  done

  if [ -z "${_var_HYLACONF}" ]; then
    echo 'Unable to find Hylafax or Hylafax+ configuration.'
    exit 1
  fi

  _var_HYLACONF_DIR="`dirname "${_var_HYLACONF}"`"

  if ! grep -q "${_opt_AVANT_CMTTAG}"'$' "${_var_HYLACONF}" >/dev/null 2>&1; then
    cat >> "${_var_HYLACONF}" << EOF
#                                                           ${_opt_AVANT_CMTTAG}
## JobFmt for AvantFAX                                      ${_opt_AVANT_CMTTAG}
#                                                           ${_opt_AVANT_CMTTAG}
JOBFMT: "%-3j %3i %1a %15o %40M %-12.12e %5P %5D %7z %.25s" ${_opt_AVANT_CMTTAG}
#                                                           ${_opt_AVANT_CMTTAG}
EOF
  fi

  # install database
  _var_TABLES="`${_opt_MYSQL} --user="${_opt_ADFB_USER}" --password="${_opt_ADFB_PASS}" "${_opt_AFDB_NAME}" -sNe 'show tables'`"
  if [ "$?" -ne 0 ]; then
    echo "##AvantFAX: Unable to view our database ${_opt_AFDB_NAME}"
    echo 'Perhaps you need to run pre first'
    echo 'If a previous uninstall failed you might need to manually:'
    echo " * DROP DATABASE ${_opt_AFDB_NAME}"
    echo " * DROP USER '${_opt_ADFB_USER}'@'localhost'"
    exit 1
  elif [ -z "${_var_TABLES}" ]; then
    ${_opt_MYSQL} --user="${_opt_ADFB_USER}" --password="${_opt_ADFB_PASS}" "${_opt_AFDB_NAME}" < "/usr/lib/${_opt_AVANTFAX_SERVERNAME}/create_tables.sql"
    if [ "$?" -ne 0 ]; then
      echo "##AvantFAX: Unable to create our tables in database ${_opt_AFDB_NAME}"
      exit 1
    fi
  elif [ "$1" -eq 2 ]; then  # upgrade database
    echo '### Checking for AvantFAX db upgrades'
    _var_AVANTFAX_VERSION="`grep '^\s\+$AVANTFAX_VERSION\s*=\s*'"'3" /root/avantfaxbackup/config.php | awk -F "'" '1 { print $2 }'`" # Example: 3.3.3. This is locked to version 3 for now.
    _var_SHORTVERSION="`echo "${_var_AVANTFAX_VERSION}" | sed -e 's/\.//g'`" # Example: 333
    # echo "### Checking for AvantFAX database upgrades to ${_var_AVANTFAX_VERSION}"

    for _var_i in `ls "/usr/lib/${_opt_AVANTFAX_SERVERNAME}/db-update-"*.sql -l | awk -F '-' '1 { print  $9 }' | awk -F "." '1 { print  $1 }'`; do
      # echo "### Checking db-update-${_var_i}.sql"
      if [ "${_var_i}" -gt "${_var_SHORTVERSION}" ]; then
        echo "### Applying db-update-${_var_i}.sql"
        ${_opt_MYSQL} --user="${_opt_ADFB_USER}" --password="${_opt_ADFB_PASS}" "${_opt_AFDB_NAME}" < "/usr/lib/${_opt_AVANTFAX_SERVERNAME}/db-update-${_var_i}.sql"
      fi
    done
    echo '### Checking for AvantFAX db upgrades complete'
  fi

  ####### DISABLE SELINUX FOR APACHE #######
  if [ "$1" -eq 1 ]; then
    echo '### Disabling SELinux for Apache (permanently)'
  fi
  setsebool -P 'httpd_disable_trans' 1 >/dev/null 2>&1

  ####### CONFIGURE AVANTFAX VIRTUALHOST #######

  # Add Hylafax spool folder into the VirtualHost open_basedir. The PKGBUILD install places this file and adds the Include to httpd.conf
  _var_file="/etc/httpd/conf/extra/httpd-${_opt_AVANTFAX_SERVERNAME}.conf"
  if [ -f "${_var_file}" ] && ! grep -q ":${_opt_HYLASPOOL}/" "${_var_file}" >/dev/null 2>&1; then
    sed -i -e 's|^\(\s\+php_admin_value open_basedir "[^"]\+\)"$|\1:'"${_opt_HYLASPOOL}"'/"|g' \
      "${_var_file}"
  fi

  # Arch Linux doesn't add virtual hosts this way. It's tested for add and remove but it's not tested for proper functionality.
  if [ "${_opt_VHOSTS}" -ne 0 ]; then
    _var_file='/etc/httpd/conf/extra/httpd-vhosts.conf'
    if ! grep -q "${_opt_AVANT_CMTTAG}"'$' "${_var_file}" >/dev/null 2>&1; then
      cat >> "${_var_file}" << EOF
NameVirtualHost *:80                           ${_opt_AVANT_CMTTAG}
                                               ${_opt_AVANT_CMTTAG}
<VirtualHost *:80>                             ${_opt_AVANT_CMTTAG}
    DocumentRoot ${_opt_INST_DIR}              ${_opt_AVANT_CMTTAG}
    ServerName ${_opt_AVANTFAX_SERVERNAME}                      ${_opt_AVANT_CMTTAG}
    ErrorLog logs/${_opt_AVANTFAX_SERVERNAME}-error_log           ${_opt_AVANT_CMTTAG}
    CustomLog logs/${_opt_AVANTFAX_SERVERNAME}-access_log common  ${_opt_AVANT_CMTTAG}
</VirtualHost>                                 ${_opt_AVANT_CMTTAG}
EOF
      _fn_reload_http
      if [ "$1" -eq 1 ]; then
        echo '### Reloading your http server to access AvantFAX'
      fi
    fi
    chmod 644 "${_var_file}"
  fi

  ####### SYMLINK AVANTFAX SCRIPTS #######

  _var_file="${_var_HYLACONF_DIR}/sendfax.conf"
  if ! grep -q "^CoverCmd:\s\+${_opt_INST_DIR}/" "${_var_file}" >/dev/null 2>&1; then
    echo "CoverCmd:		${_opt_INST_DIR}/includes/faxcover.php  ${_opt_AVANT_CMTTAG}" >> "${_var_file}"
  fi
  chmod 644 "${_var_file}"

  _var_file="${_opt_INST_DIR}/includes/local_config.php"
  cp -p "${_opt_INST_DIR}/includes/local_config-example.php" "${_var_file}"
  sed -i -e "s:^\(\s\+define('AFDB_USER',\s*'\)[^']\+\('\):\1${_opt_ADFB_USER}\2:g" \
         -e "s:^\(\s\+define('AFDB_PASS',\s*'\)[^']\+\('\):\1${_opt_ADFB_PASS}\2:g" \
         -e "s:^\(\s\+define('AFDB_NAME',\s*'\)[^']\+\('\):\1${_opt_AFDB_NAME}\2:g" \
         -e 's:^\(\s\+$HYLASPOOL'"\s*=\s*'\)[^']\+\('\):\1${_opt_HYLASPOOL}\2:g" \
         -e 's:^\(\s\+$WWWUSER'"\s*=\s*'\)[^']\+\('\):\1${_opt_WWWUSER}\2:g" \
         -e 's:^\(\s\+$AVANTFAX_SERVERNAME'"\s*=\s*'\)[^']\+\('\):\1${_opt_AVANTFAX_SERVERNAME}\2:g" \
    "${_var_file}"

  for _var_file in 'faxrcvd.php' 'dynconf.php' 'notify.php'; do
    if [ ! -e "${_opt_HYLASPOOL}/bin/${_var_file}" ]; then
      ln -s "${_opt_INST_DIR}/includes/${_var_file}" "${_opt_HYLASPOOL}/bin/${_var_file}"
    fi
  done

  # Arch Linux 'man file' shows /usr/share/file/misc/magic.
  # I can't find where file or magic is used in the php files so
  # so I don't know how to fix this.
  ####### FIX FILEINFO #######
  #for _var_file in `ls "/usr/share/file/magic*"`; do
  #  if [ ! -e "/usr/share/misc/`basename ${_var_file}`" ]; then
  #    ln -s "${_var_file}" "/usr/share/misc/"
  #  fi
  #done

  ####### SETUP SUDO PERMISSIONS #######
  if [ ! -d '/etc/sudoers.d' ]; then
    if [ "$1" -eq 1 ]; then
      echo '### Configuring sudo sans sudoers.d'
    fi

    if ! grep -ql "^${_opt_SUDO_LINE}" '/etc/sudoers' >/dev/null 2>&1; then
      sed -i -e 's:^\([^#].*requiretty.*\)$:'"# \1 ${_opt_AVANT_CMTTAG}:g" /etc/sudoers
      echo "${_opt_SUDO_LINE} -u * -p * *  ${_opt_AVANT_CMTTAG}" >> /etc/sudoers
    fi
  fi

  ####### Sendmail setting
  if [ -f '/etc/mail/trusted-users' ]; then
    grep "^${_opt_WWWUSER}"'$' '/etc/mail/trusted-users' || echo "${_opt_WWWUSER}" >> '/etc/mail/trusted-users'
  fi

  ####### CONFIGURE MODEMS TO USE AVANTFAX #######
  # Make backup of HylaFAX configuration
  #  if [ ! -d "${_opt_HYLASPOOL}/etc/abackup" ]; then
  #    mkdir -p "${_opt_HYLASPOOL}/etc/abackup"
  #    cp -f "${_opt_HYLASPOOL}/etc/config"* "${_opt_HYLASPOOL}/etc/hosts.hfaxd" "${_opt_HYLASPOOL}/etc/abackup/" >/dev/null 2>&1
  #  fi

  for _var_file in `ls "${_opt_HYLASPOOL}/etc/config".*`; do
    _var_file_base="`basename "${_var_file}"`"
    if [ "${_var_file}" != "${_opt_HYLASPOOL}/etc/config.sav" \
      -a "${_var_file}" != "${_opt_HYLASPOOL}/etc/config.devid" \
      -a ! -L "${_var_file}" \
      -a "`expr "${_var_file_base}" : '.*~.*'`" -eq 0 ]; then
      if ! grep -q "${_opt_AVANT_CMTTAG}" "${_var_file}" >/dev/null 2>&1; then
        cat >> "${_var_file}" << EOF
#                                 ${_opt_AVANT_CMTTAG}
#                                 ${_opt_AVANT_CMTTAG}
## AvantFAX                       ${_opt_AVANT_CMTTAG}
#                                 ${_opt_AVANT_CMTTAG}
FaxRcvdCmd:     bin/faxrcvd.php   ${_opt_AVANT_CMTTAG}
DynamicConfig:  bin/dynconf.php   ${_opt_AVANT_CMTTAG}
UseJobTSI:      true              ${_opt_AVANT_CMTTAG}
#                                 ${_opt_AVANT_CMTTAG}
EOF
      fi

      ####### ADD MODEMS TO AVANTFAX DATABASE #######
      _var_modem="`echo ${_var_file} | awk -F'/' '{print $6}' | awk -F'.' '{print $2}'`"
      #echo ${_opt_MYSQL} --user="${_opt_ADFB_USER}" --password="${_opt_ADFB_PASS}" "${_opt_AFDB_NAME}" -e "select count(*) as existe from Modems where device='${_var_modem}'"
      _var_exists="`${_opt_MYSQL} --user="${_opt_ADFB_USER}" --password="${_opt_ADFB_PASS}" "${_opt_AFDB_NAME}" -sNe "select count(*) as existe from Modems where device='${_var_modem}'"`"
      #_var_exists="`expr "${_var_exists}" : '^existe\s\+\([0-9]\+\)\$'`"
      #echo "${var_exists}"
      [ -z "${_var_exists}" ] && _var_exists=0
      if [ "${_var_exists}" -eq 0 ]; then
        # ADD MODEMS TO AVANTFAX DATABASE
        echo "Adding modem: ${_var_modem}"
        ${_opt_MYSQL} --user="${_opt_ADFB_USER}" --password="${_opt_ADFB_PASS}" "${_opt_AFDB_NAME}" -e "INSERT INTO Modems SET device='${_var_modem}', alias ='${_var_modem}'"
        if [ "$?" -ne 0 ]; then
          echo "##AvantFAX: Failed to add modem ${_var_modem}"
          exit 1
        fi
      fi
    fi
  done

  _var_file="${_opt_HYLASPOOL}/etc/config"
  if ! grep -q "NotifyCmd:\s\+bin/notify.php" "${_var_file}" >/dev/null 2>&1; then
    cat >> "${_var_file}" << EOF
#                                 ${_opt_AVANT_CMTTAG}
#                                 ${_opt_AVANT_CMTTAG}
## AvantFAX                       ${_opt_AVANT_CMTTAG}
#                                 ${_opt_AVANT_CMTTAG}
NotifyCmd:      bin/notify.php    ${_opt_AVANT_CMTTAG}
#                                 ${_opt_AVANT_CMTTAG}
EOF
    chmod 644 "${_var_file}"
  fi

  ####### ADD CRONTAB ENTRIES #######
  if [ -d '/etc/cron.d' -a "${_opt_SYSTEMD}" -eq 0 ]; then
    _var_file="/etc/cron.d/${_opt_AVANTFAX_SERVERNAME}"
    if [ ! -f "${_var_file}" ]; then
      printf "0 0 * * *\t`which su` -s `which sh` '${_opt_WWWUSER}' -c 'cd ${_opt_INST_DIR}; includes/avantfaxcron.php -t 2'\n" > "${_var_file}"
    fi
    chmod 644 "${_var_file}"
  fi

  chown    "${_opt_WWWUSER}:${_opt_HYLA_GROUP}" "${_opt_INST_DIR}/tmp" "${_opt_INST_DIR}/faxes"
  chown -R "${_opt_WWWUSER}:${_opt_HYLA_GROUP}" "${_opt_INST_DIR}/faxes/recvd" "${_opt_INST_DIR}/faxes/sent"
# chmod -R 777 "${_opt_INST_DIR}/faxes" "${_opt_INST_DIR}/tmp"

  ####### CONFIGURE FAXMAIL #######
  _var_file="${_var_HYLACONF_DIR}/faxmail.conf"
  if [ ! -f "${_var_file}" ]; then
    cat > "${_var_file}" << EOF
#                                      ${_opt_AVANT_CMTTAG}
AutoCoverPage: false                   ${_opt_AVANT_CMTTAG}
TextPointSize: 12pt                    ${_opt_AVANT_CMTTAG}
Headers: Message-id Date Subject From  ${_opt_AVANT_CMTTAG}
MailUser: faxmail                      ${_opt_AVANT_CMTTAG}
#                                      ${_opt_AVANT_CMTTAG}
EOF
  fi
  chmod 644 "${_var_file}"

  if [ "$1" -eq 1 ]; then
    if [ -z "`command -v ip`" ]; then
      # _var_i="`/sbin/ifconfig eth0 | grep 'inet addr' | awk -F' ' '{print \$2}' | awk -F':' '{print \$2}'`"
      _var_i="`ifconfig | grep '^\s\+inet [0-9\.]\+ ' | awk -F' ' '{print \$2}' | grep -m 1 -xv '127.0.0.1'`"
    else
      _var_i="`ip addr`"
      _var_i="`echo "${_var_i}" | grep ' inet ' | awk '{print \$2}' | sed -e 's:/.\+\$::g' | grep -m 1 -xv '127.0.0.1'`"
    fi
    echo "###############################################################################"
    echo "Log into the AvantFAX Administrative interface at: http://${_var_i}/${_opt_AVANTFAX_SERVERNAME}/admin/"
    echo "Username: admin"
    echo "Password: password"
    echo "###############################################################################"
    echo "Done"
  fi
}

# $1 flag: 0 = uninstall, 1 = upgrade
_fn_setup_preun() {
  if [ "$1" -eq 0 ]; then
    rm -rf "${_opt_INST_DIR}/tmp/*"
  fi
}

# For files that don't have a .d folder, clean out our tagged lines, preserving permissions.
_fn_cleanfile() {
  if [ -s "$1" ]; then
    rm -f '/tmp/avantfax.cleanfile'
    if grep -q "${_opt_AVANT_CMTTAG}"'$' "$1" >/dev/null 2>&1; then
      cp -p "$1" '/tmp/avantfax.cleanfile'
      grep -v "${_opt_AVANT_CMTTAG}"'$' '/tmp/avantfax.cleanfile' > "$1"
      rm -f '/tmp/avantfax.cleanfile'
      if [ ! -s "$1" ]; then
        rm -f "$1"
      fi
      return 0
    fi
  fi
  return 1
}

# This script must be copied at %preun by the package installer.
# When the package %postun runs this has long been deleted.

# $1 flag: 0 = uninstall, 1 = upgrade
_fn_setup_postun() {
  if [ "$1" -eq 0 ]; then
    echo "### Uninstalling (postun)"
    echo "### Removing HTTP virtual host"
    rm -rf "${_opt_BIN_DIR}"
    if _fn_cleanfile '/etc/httpd/conf/extra/httpd-vhosts.conf'; then
      _fn_reload_http
    fi

    echo "### Restoring HylaFAX settings"
    rm -f "/etc/cron.d/${_opt_AVANTFAX_SERVERNAME}" "${_opt_HYLASPOOL}/bin/notify.php" "${_opt_HYLASPOOL}/bin/faxrcvd.php" "${_opt_HYLASPOOL}/bin/dynconf.php"

    # Clean up modem files
    for _var_file in "${_opt_HYLASPOOL}/etc/config"*; do
      _fn_cleanfile "${_var_file}"
    done

    _var_file='/etc/mail/trusted-users'
    if [ -f "${_var_file}" ] && grep -q "^${_opt_WWWUSER}"'$' "${_var_file}" >/dev/null 2>&1; then
      _var_tmpfile='/tmp/avantfax.trusted-users'
      cp -p "${_var_file}" "${_var_tmpfile}"
      grep -v "^${_opt_WWWUSER}"'$' "${_var_tmpfile}" > "${_var_file}"
      rm -f "${_var_tmpfile}"
    fi

    ${_opt_HYLA_BIN_DIR}/faxdeluser "${_opt_WWWUSER}"

    echo "### DB Settings: ${_opt_ADFB_USER} ${_opt_ADFB_PASS} ${_opt_AFDB_NAME}" # ${_opt_ROOTMYSQLPWD}"

    _var_users="`${_opt_MYSQL} --user="${_opt_ADFB_USER}" --password="${_opt_ADFB_PASS}" "${_opt_AFDB_NAME}" -sNe "select username from UserAccount"`"

    for _var_i in ${_var_users}; do
      ${_opt_HYLA_BIN_DIR}/faxdeluser "${_var_i}"
    done

    _fn_cleanfile '/etc/sudoers'

    echo "### Removing user ${_opt_ADFB_USER}"
    ${_opt_MYSQL} --user='root' --password="${_opt_ROOTMYSQLPWD}" 'mysql' -e "DROP USER '${_opt_ADFB_USER}'@'localhost'"

    echo "### Removing database: ${_opt_AFDB_NAME}"
    ${_opt_MYSQLADMIN} --user='root' --password="${_opt_ROOTMYSQLPWD}" --force drop "${_opt_AFDB_NAME}"

    rm -f "$0.password"
    echo "### Done"
  #elif [ "$1" -eq 1 ]; then
  #	echo "### Upgrading (postun)"
  fi
}

_fn_usage_boom() {
  echo "##Setup tool for AvantFAX"
  echo ''
  echo "Usage: `basename "$1"` flag rpmfunc [[flag] rpmfunc...]"
  echo 'flag    = {0,1,2} (same as RPM .spec)'
  echo 'rpmfunc = {package,install,build,pre,post,preun,postun}'
  echo ''
  echo "But ignore all that. That's for package build scripts."
  echo "You're here because part of the install was missed."
  echo 'What you want is to finish your install with this:'
  echo ''
  echo "`basename "$1"` install"
  echo ''
  echo 'This should be run anytime you upgrade Hylafax,'
  echo 'run faxaddmodem, or faxsetup.'
  echo 'Modems removed from Hylafax can be manually removed in AvantFAX.'
  exit 0
}

# $1 flag: 1 = install, 2 = upgrade
_fn_setup_install() {
  _fn_setup_build
  _fn_setup_pre "$1"
  _fn_setup_post "$1"
}

if [ "$#" -eq 0 ]; then
  _fn_usage_boom "$0"
fi

_var_flag=1
while [ "$#" -ne 0 ]; do
  case "$1" in
  0|1|2) _var_flag="$1";;
  package|install|build|pre|post|preun|postun) "_fn_setup_$1" "${_var_flag}";;
  *) _fn_usage_boom "$0";;
  esac
  shift
done
