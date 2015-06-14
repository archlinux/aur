*** For general usage instructions for burp backup refer to the link below:
http://burp.grke.org/

*** To setup a burp server edit the "/etc/burp/burp-server.conf" file as desired and then
execute the following commands:
# systemctl start burp-server.service
# systemctl enable burp-server.service

*** To create your first client configuration on the server.
Copy the "testclient" example from /etc/burp/clientconfdir/incexc to
/etc/burp/clientconfdir and edit it accordingly.

*** To setup a linux client computer to run regular backups, edit "/etc/burp/burp.conf" and
then execute the commands below.
# systemctl start burp-client.timer
# systemctl enable burp-client.timer
The default timer configuration works pretty well, however if you want to manually edit the timer
file it is located at "/usr/lib/systemd/system/burp-client.timer"
The timer file calls "burp-client.service", so you can also edit that file in the same
folder location as well.  Note that you do not need to start or enable the service file
as the timer calls it directly.

*** Alternately to setup a cron service on the client to run regular backups ensure that a
cron utility is installed (See the link below).  Cron is not installed in ArchLinux 
by default.
https://wiki.archlinux.org/index.php/Cron
Then copy the burp cron template to the appropriate location such as in the example below.
# cp /usr/share/burp/burp.cron.d /etc/cron.d/burp
