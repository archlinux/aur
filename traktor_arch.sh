#!/bin/bash
clear

echo -e "Traktor v1.3\nTor will be automatically installed and configured…\n\n"

# Write Bridge
sudo wget https://AmirrezaFiroozi.github.io/traktor/torrcV3 -O /etc/tor/torrc > /dev/null

# Fix Apparmor problem
#sudo sed -i '27s/PUx/ix/' /etc/apparmor.d/abstractions/tor
#sudo apparmor_parser -r -v /etc/apparmor.d/system_tor

# Make tor log directory 
sudo systemctl start tor 1>/dev/null 2>&1
sudo systemctl stop tor 1>/dev/null 2>&1

sudo mkdir /var/log/tor/
sudo chown tor:tor /var/log/tor/
sudo chmod g+w /var/log/tor/
# Write Polipo config
echo 'logSyslog = true
logFile = /var/log/polipo/polipo.log
proxyAddress = "::0"        # both IPv4 and IPv6
allowedClients = 127.0.0.1
socksParentProxy = "localhost:9050"
socksProxyType = socks5' | sudo tee /etc/polipo/config > /dev/null
sudo systemctl restart polipo


# Install Finish
echo "Install Finished successfully…"
sudo systemctl start tor 1>/dev/null 2>&1
sudo systemctl enable tor 1>/dev/null 2>&1
# Wait for tor to establish connection
echo "Tor is trying to establish a connection. This may take long for some minutes. Please wait" | sudo tee /var/log/tor/log
bootstraped='n'
sudo systemctl restart tor
while [ $bootstraped == 'n' ]; do
	if sudo cat /var/log/tor/log | grep "Bootstrapped 100%: Done"; then
		bootstraped='y'
	else
		sleep 1
	fi
done
echo -e "\nDo you want to install tor-browser too? [y/N]"

read -n 1 SELECT
if [ "$SELECT" = "Y" -o "$SELECT" = "y" ]
then
yaourt -S tor-browser-en-ir
fi
echo "Congratulations!!! Your computer is using Tor. may run tor-browser-en-ir now."
