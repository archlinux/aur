======================================================
KYOCERA SANE DRIVER
v2.0.0326

(c) 2020 KYOCERA Document Solutions Inc.
======================================================

---------------------------------------------------------
Provided packages
---------------------------------------------------------
For Ubuntu and Debian OS
   - kyocera-sane_2.0.0326_i386.deb
   - kyocera-sane_2.0.0326_amd64.deb

For Fedora
   - kyocera-sane-2.0-0326.i586.rpm
   - kyocera-sane-2.0-0326.x86_64.rpm

---------------------------------------------------------
HOW TO INSTALL/UNINSTALL
---------------------------------------------------------
For Debian package:
    Install / Upgrade from existing installation:
	$ sudo dpkg -i [package-filename]
    Uninstall (keep configuration files):
        $ sudo dpkg -r kyocera-sane
    Uninstall (purge / delete configuration files):
        $ sudo dpkg -P kyocera-sane
    Search / check installation
        $ sudo dpkg -l | grep 'kyocera-sane'


For RPM package:
    Install:
        # sudo rpm -ihv [package-filename]
    Upgrade from existing installation:
		For older RPM package until version 1.2.2729, KyoceraSANE driver must be uninstalled when upgrading to a newer RPM package.
			# sudo rpm -e kyocera-sane
			# sudo rpm -ihv [new-package-filename]
		RPM package version starting from KyoceraSANE_v1.2.2729a may upgrade automatically to a newer RPM package without uninstalling old RPM package.
			# sudo rpm -Uhv [package-filename]
    Uninstall:
        # sudo rpm -e kyocera-sane
    Search / check installation
        # rpm -qa | grep kyocera-sane


		
Configuration for Network devices:

  1. After installing the Debian package, open the following file in a text editor.
	/etc/sane.d/kyocera_devices.conf

  2. Add the hostname/IP address and model of your device as "<Hostname> <ModelName>".
	E.g.
	PC12345 FS-1135MFP
	192.168.1.100 FS-1135MFP

     You can add more than 1 device to the list (1 device per line).
     Please refer to instructions provided in configuration file for more details.

NOTE: 	- SU privileges may be required to modify the configuration file.
	- For RPM based OS, might need to configure Firewall settings and change interface to Internal or Trusted Zone to automatically detect devices.

---------------------------------------------------------
Supported OS
--------------------------------------------------------- 
- Ubuntu 18.04 LTS x64
- Ubuntu 18.04 LTS x32
- Fedora 31 x64
- Fedora 30 x86
- Debian 9 x64
- Debian 9 x86

---------------------------------------------------------
USB Scan
--------------------------------------------------------- 
1. A4 USB scan was tested on ECOSYS M2040dn and ECOSYS M2640dw

Limitations:
1.  XSane crashes when scanning 998 pages. In this scenario scanning, there are only 871 pages scanned
2.  Failure to install sane driver using package manager
3.  Invalid argument error is encountered when successive scan is performed via terminal commands
4.  Remote function is stopped after DP jam error is cleared
5.  Out of memory error" is encountered when scanning pages in Full Color mode (CentOS)
6.  Scanning via terminal is suddenly killed after scanning more than 370 A6 sheets
7.  Error occurs when cancellation is done almost at the end of scanning of 4 pages or more
8.  XSane crashes after the maximum of 998 scanned pages has been reached by the device.(CentOS)
9.  Error message is displayed during scanning of 998 pages (Ubuntu, Fedora, Debian)

----------------------------------------------------------
Note
----------------------------------------------------------
The following copyright notices apply:

Copyright (c) 1998-2011 The OpenSSL Project.  All rights reserved.
Copyright (C) 1995-1998 Eric Young (eay@cryptsoft.com)
		All rights reserved.