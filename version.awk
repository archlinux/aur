#! /usr/bin/env -S awk -f

/Version:.*/ { print $2 }
