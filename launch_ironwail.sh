#!/bin/sh
# Ironwail comes with a ironwail.pak file that needs to be in the same directory as the executable.
# Unfortunately creating a symbolic link to ironwail in /usr/bin causes it to not detect the .pak in the destination folder.
# Thus this helper script has been created to help fix the issue.

/opt/ironwail/ironwail $@
