#!/bin/bash
## This script executes the blynk server.
## It should not be run manually, please use systemd unit instead.

# additional options to pass to blynk server
additionalOptions=

# add sms.properties if found
if [ -f /etc/blynk/sms.properties ]; then
    additionalOptions="-smsConfig /etc/blynk/sms.properties"
fi

# add mail.properties if found
if [ -f /etc/blynk/mail.properties ]; then
    additionalOptions="-mailConfig /etc/blynk/mail.properties ${additionalOptions}"
fi

exec /usr/bin/java -jar /usr/share/blynk/blynk-server.jar -serverConfig /etc/blynk/server.properties ${additionalOptions}
