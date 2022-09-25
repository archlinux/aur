RTAPP suite
RTAPP RTSTATUS RTCARDS

Copyright Piero Olmeda - AudioLinux  <audiolinux AT fastmail DOT fm>
https://www.audio-linux.com

License: custom - All rights reserved

---------------------------------------------------------------

Before running rtapp for the first time or after an upgrade, take a look at the config file located
at /etc/rtapp/rtapp.conf and make sure the defaults
are OK.

The old configuration file is saved automatically after an upgrade to /etc/rtapp/rtapp.conf.pacsave

To start rtapp, you must start the systemctl timer:
systemctl start rtapp.timer

Then you can enable the service at boot:
systemctl enable rtapp.timer

rtapp.timer will call rtapp.service in /usr/lib/systemd/system

rtapp will check the priority of audio applications every 60 seconds.
If you wanto to change this please edit OnUnitActiveSec in /usr/lib/systemd/system/rtapp.timer

RTAPP
Rtapp will monitor every minute applications defined in APPLICATIONS and will give FIFO priority defined in MAX_PRIORITY
It can be configured in 3 ways:
manual: the applications priority will have the value set in MAX_PRIORITY
manualdec: same as manual but the priority will decrease by one step from the first to the last application
auto: the value will be a step (RTIRQ_PRIO_DECR) under the minimum value of priority set by rtirq (this value depends on the number of items in RTIRQ_NAME_LIST and the number of audio hardware connected to the same USB bus)
autodec: same as auto but the priority will decrease by one step from the first to the last application

-------------------

Configuration file example:

# Here you can list the applications that you want to give realtime priority
APPLICATIONS="mpd networkaudiod squeezelite hqplayer4desktop hqplayerd RoonAppliance RoonBridge spotifyd shairport-sync upmpdcli slimserver.pl"

# Maximum value MAX_PRIORITY for application priority
MAX_PRIORITY="85"

MODE="autodec"

-------------------

For the variables RTIRQ_PRIO_DECR, RTIRQ_PRIO_HIGH, RTIRQ_PRIO_DECR, RTIRQ_NAME_LIST see rtirq documentation and rtirq configuration file /etc/rtirq.conf

RTAPP is designed for working with rtirq enabled:
systemctl enable rtirq

RTSTATUS
rtstatus will show the status of irq and applications realtime FIFO priorities.

RTCARDS
It is very useful for checking if your audio card is sharing IRQ with another device 
(cat /proc/interrupts instead would be useless because it will not show card names)
