#!/usr/bin/expect -f

set timeout -1

spawn {*}$argv

expect "Proceed? (Yes/No)" { send "Yes\n" }
expect "(Yes/No)" { send "No\n" }
expect "Press any key to exit (or wait 30 seconds)" { send "\n" }
