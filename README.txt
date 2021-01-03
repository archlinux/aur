The package uses the repository version of OpenJDK 8.

If you have problems with java compatibility, you can try using the version of OpenJDK 8 that is specified by the developers.
To do so, replace the default PKGBUILD with PKGBUILD-jre-8u201-x86_64 and then build the package as usual.
This downloads the jre from the xmage servers as a standalone java installation and simulates the behaviour 
of the default xmage installer.
This is only available for the x86_64 architecture. 

The developers assign 512MB of memory to each of mage-client and mage-server. 
This is changed to 2048MB in the PKGBUILD. If you wish to modify this, change the -Xmx2048m in
/bin/mage-client or /bin/mage-server. 

If you encounter a gray/blank screen when you start the client, see here for a possible solution
https://www.reddit.com/r/XMage/comments/9k2t9o/new_install_blank_screen_when_launching_client/

The package comes with a systemd unit file to load mage-server on boot. The service restarts if mage-server crashes or closes unexpectedly. 
It is automatically installed to /usr/lib/systemd/system/mage-server.service

The xmage.desktop file is installed to /usr/share/applications/xmage.desktop. 
This makes it visible in application menus. It can be installed to ~/Desktop if a desktop icon is desired. 
