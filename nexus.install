#!/bin/sh
# $Id$
# vim:set ts=2 sw=2 et:

# arg 1:  the new package version
pre_install() {
 /bin/true
}

# arg 1:  the new package version
post_install() {
  ln -s /opt/nexus/bin/nexus /etc/rc.d/nexus

  echo ">>> Creating user and group and setting permissions..."
  getent group nexus > /dev/null || usr/sbin/groupadd nexus
  getent passwd nexus > /dev/null || usr/sbin/useradd -c \
        'Maven Repository Manager' -g nexus -d '/opt/nexus' \
        --system -s /bin/bash nexus &> /dev/null

  cd opt/nexus

  chown -R nexus:nexus * 
  chown -R nexus:nexus /opt/sonatype-work/
  chown -R nexus:nexus /opt/nexus 
  chown -R nexus:nexus /opt/nexus/run

  cat << EOF
>>>
>>>                      Systemd service file added
>>> If you would like to start it on system startup, please enable it by 
>>> systemctl enable nexus.service
>>>
>>> Nexus is running by default on port 8081 and is bound to all interfaces,
>>> you can change this in the nexus.properties as well. 
>>>
>>> The nexus.log can be found in /opt/nexus/logs.
>>>
>>> For additional information please visit http://nexus.sonatype.org
EOF
}

# arg 1:  the new package version
# arg 2:  the old package version
pre_upgrade() {
 /bin/true
}

# arg 1:  the new package version
# arg 2:  the old package version
post_upgrade() {
  cd opt/nexus

  chown -R nexus:nexus * 
  chown -R nexus:nexus /opt/sonatype-work
  chown -R nexus:nexus /opt/nexus 
  chown -R nexus:nexus /opt/nexus/run

}

# arg 1:  the old package version
pre_remove() {
 /bin/true
}

# arg 1:  the old package version
post_remove() {
  getent passwd nexus > /dev/null && usr/sbin/userdel nexus &>/dev/null
  getent group nexus > /dev/null && usr/sbin/groupdel nexus &>/dev/null  

	if [ -d /opt/nexus/run ] ; then
	    rm -r /opt/nexus/run
	fi  

	if [ -d /opt/sonatype-work ] ; then
	    rm -r /opt/sonatype-work
	fi  

	if [ -h /etc/rc.d/nexus ] ; then
	    rm /etc/rc.d/nexus
	fi  

}

