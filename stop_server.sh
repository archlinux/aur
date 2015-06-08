#!/bin/bash

# Grace period before shutdown
grace=10

# Countdown
i=$grace
while [ $i -gt 0 ]
do
  # Until the last 5 seconds
  if [ $i -ge 5 ]; then
    # Issue warning every 5 seconds
    if [ `expr $i % 5` -eq 0 ]; then
    /srv/craftbukkit/send_command.sh "say $i seconds before shutdown"
    fi
  # Notify every second
  else
    /srv/craftbukkit/send_command.sh "say $i seconds left"
  fi
  let i=$i-1
  sleep 1
done

# Shutdown server
/srv/craftbukkit/send_command.sh "stop"

# Give some time to the server to shutdown cleanly before
# systemd starts TERMinating and KILLing everything...
sleep 10
