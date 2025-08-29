# Odd Static Hosts Daemon
Temporarily (or not) edit /etc/hosts with ease

Includes an systemd service to automaticly clear any temporary enteries on shutdown and reboot.

Does not require packaging, just plop the python file into `/usr/local/bin/oshctl` and run `oshctl service install` as root!
