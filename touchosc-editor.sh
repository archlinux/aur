#! /bin/bash

# Launch the TouchOSC editor. NOTE: While we do pass arguments on the command
# line, at present the Java application just ignores these on Linux.
exec java -jar /usr/share/java/TouchOSCEditor.jar "$@"
