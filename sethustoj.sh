
setup() {
  #ln -s /usr/share/webapps/hustoj /srv/http/

  # enable extension=pdo_mysql.so in file /etc/php/php.ini
  # systemctl restart php-fpm

  useradd -m -u 1536 judge
  cd /home/judge/
  mkdir etc data log
  cp /usr/share/hustoj/java0.policy  /home/judge/etc
  cp /usr/share/hustoj/judge.conf    /home/judge/etc

  if grep "OJ_SHM_RUN=0" etc/judge.conf ; then
    mkdir run0 run1 run2 run3
    chown http:http run0 run1 run2 run3
  fi

  DBNAME=root
  DBUSER=root
  DBPASS=root

  printf "Input Database(MySQL) Username:"
  read tmp
  if test -n "$tmp"; then
    DBUSER="$tmp"
  fi
  printf "Input Database(MySQL) Password:"
  read tmp
  if test -n "$tmp"; then
    DBPASS="$tmp"
  fi
  DBNAME="${DBUSER}"

  sed -i "s/OJ_DB_NAME=jol/OJ_DB_NAME=$DBNAME/g"       etc/judge.conf
  sed -i "s/OJ_USER_NAME=root/OJ_USER_NAME=$DBUSER/g"  etc/judge.conf
  sed -i "s/OJ_PASSWORD=root/OJ_PASSWORD=$DBPASS/g"    etc/judge.conf
  sed -i "s/OJ_COMPILE_CHROOT=1/OJ_COMPILE_CHROOT=0/g" etc/judge.conf
  chmod 700 etc/judge.conf

  sed -i "s/DB_NAME=\"jol\"/DB_NAME=\"$DBNAME\"/g"  /usr/share/webapps/hustoj/include/db_info.inc.php
  sed -i "s/DB_USER=\"root\"/DB_USER=\"$DBUSER\"/g" /usr/share/webapps/hustoj/include/db_info.inc.php
  sed -i "s/DB_PASS=\"root\"/DB_PASS=\"$DBPASS\"/g" /usr/share/webapps/hustoj/include/db_info.inc.php
  chmod 700 /usr/share/webapps/hustoj/include/db_info.inc.php
  chown http:http /usr/share/webapps/hustoj/include/db_info.inc.php
  chown http:http /usr/share/webapps/hustoj/upload data run0 run1 run2 run3
  if grep client_max_body_size /etc/nginx/nginx.conf ; then 
    echo "client_max_body_size already added" ;
  else
    sed -i "s:include /etc/nginx/mime.types;:client_max_body_size    80m;\n\tinclude /etc/nginx/mime.types;:g" /etc/nginx/nginx.conf
  fi

  cp /usr/share/hustoj/db.sql /tmp/tmp-hustoj-db.sql
  sed -e "s|create database jol;|CREATE DATABASE IF NOT EXISTS ${DBNAME};|g" \
      -e "s|use jol;|use ${DBNAME};|g" \
      -i /tmp/tmp-hustoj-db.sql

  mysql -h localhost -u$DBUSER -p$DBPASS < /tmp/tmp-hustoj-db.sql
  echo "insert into $DBNAME.privilege values('admin','administrator','N');" | mysql -h localhost -u$DBUSER -p$DBPASS 

  sed -i "s/post_max_size = 8M/post_max_size = 80M/g" /etc/php/php.ini
  sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 80M/g" /etc/php/php.ini

  if grep "/usr/bin/judged" /etc/rc.local ; then
    echo "auto start judged added!"
  else
    sed -e "s|exit 0|/usr/bin/judged\nexit 0|g" -i /etc/rc.local
  fi

}

setup

