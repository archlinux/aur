# /bin/bash

SRCPATH="/tmp/respect-my-internet"
DESTPATH="/etc/opensnitchd"

echo "Blocklist update in progress"

if (ls /tmp | grep -i "respect-my-internet") > /dev/null ; then 
sudo rm -rf "$SRCPATH"
fi
if (ls /etc/opensnitchd/ | grep -i "rules") > /dev/null ; then echo "rule directory exist";
else sudo mkdir "$DESTPATH/rules"
fi
if (ls /etc/opensnitchd/ | grep -i "ip") > /dev/null ; then sudo rm -rf "$DESTPATH/ip/"
fi
if (ls /etc/opensnitchd/ | grep -i "blocklist") > /dev/null ; then echo "blocklist directory exist";
else sudo mkdir "$DESTPATH/blocklist/"
fi

git clone https://github.com/TheCyberArcher/Respect-My-Internet/ /tmp/respect-my-internet/
sudo mv "$SRCPATH/blocklist/respect-my-internet.txt" "$DESTPATH/blocklist/"
sudo mv "$SRCPATH/blocklist/ip/" "$DESTPATH"
sudo mv $SRCPATH/rules/* $DESTPATH/rules/

echo "Succes ! Updated from https://github.com/TheCyberArcher/Respect-My-Internet"

### Cleaning

echo "Cleaning"
sudo rm -rf "$SRCPATH"

### relaunch opensnitchd.service

sudo systemctl restart opensnitchd.service
echo "Opensnitch service restarted"