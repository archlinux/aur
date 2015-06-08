#!/bin/bash

SERVER="/srv/craftbukkit"
FILENAME="`date +%Y%m%d%H%M`.tar.bzip2"

$SERVER/send_command.sh "save-off"
$SERVER/send_command.sh "save-all"

echo "Creating compressed file..."
cd $SERVER
tar -cjf $SERVER/backup/$FILENAME world world_nether world_the_end

/srv/craftbukkit/send_command.sh "save-on"
echo "Backup done."
