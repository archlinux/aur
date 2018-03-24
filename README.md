# NI-VISA for Arch Linux

## VI_ERROR_SYSTEM_ERROR when using
You need to **logout and login before first use** in order to set VXIPNPPATH environment variable.

## USB-RAW devices do not work
If USB-RAW devices do not work, try following (as root) and restart your PC:
```
# AddUsbRawPermissions.sh
# gpasswd -a <user> usbraw
```

##  USB-TMC devices do not work
```
# gpasswd -a <user> usbtmc
# rmmod usbtmc
# echo 'blacklist usbtmc' > /etc/modprobe.d/nousbtmc.conf
```

## refs
- http://digital.ni.com/public.nsf/allkb/A10090850FF0887A86257926007A7E96
- https://github.com/python-ivi/python-usbtmc#configuring-udev
- https://github.com/pyvisa/pyvisa/issues/272
