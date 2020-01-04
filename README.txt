The developers assign 512MB of memory to each of mage-client and mage-server. 
This is changed to 2048MB in the PKGBUILD. If you wish to modify this, change the -Xmx2048m in
/bin/mage-client or /bin/mage-server. 

Due to compatibility issues with the current version of java in the repositories,
xmage now installs a dedicated version of java to /usr/share/xmage/java. 
This is only applicable for x86_64 machines. For all other architectures, the package requires 
the jre8-openjdk package. The developers only guarantee compatibility with a single version of 
java. 

If you encounter a gray/blank screen when you start the client, see here for a possible solution
https://www.reddit.com/r/XMage/comments/9k2t9o/new_install_blank_screen_when_launching_client/

The package comes with a systemd unit file to load mage-server on boot. 
It is automatically installed to /usr/lib/systemd/system/mage-server.service
