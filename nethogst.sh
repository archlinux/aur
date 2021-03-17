#!/bin/sh
exec /usr/bin/nethogs -t > var/lib/nethogs/$(/usr/bin/date +%Y-%m-%d_%H-%M-%S).log 
