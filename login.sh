#!/bin/bash 
relpath=$1
thefile=$2
site="http://www.culatools.com/user/plugins/protect/new_rewrite/login.php?v=-any&url=/$relpath/$thefile"

name=cornholio
pass=password

# get the initial session cookie
cookies=/tmp/cron-cookies.txt
wget -O /tmp/login.txt --save-cookies $cookies --keep-session-cookies $site
str=`grep login_attempt_id /tmp/login.txt`
idvalue=`echo $str | awk 'login_attempt_id" value="{print $4}' FS='[ ;]' | replace value\= '' | replace '"' ''`

# do the login
wget -O `pwd`/$thefile --keep-session-cookies --save-cookies $cookies --load-cookies $cookies --post-data="amember_login=$name&amember_pass=$pass&login_attempt_id=$idvalue" $site

rm /tmp/cron-cookies.txt
rm /tmp/login.txt
