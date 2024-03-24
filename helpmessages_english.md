# English translation of the help messages of the software at https://github.com/forth32/balong-fbtools.

## `README.md`:

Utilities for working with flash modems on the balong platform

The utilities work through the fastboot-interface. To put the modem in this mode you need to do two things:

1. In the first byte of nvram cell 53521 set the lowest bit to 1.  
   For example it goes like this:
   ```
   at^nvwrex=53521,0,64,3D E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00 00
   ```

2. Restart the modem in fastboot mode. This can be done from the modem's linux console with the command  
   ```
   ecall power_off_reboot_operation
   ```

After that the modem goes into the fastboot-mode. This will create a device with `vid=12d1`, the pid for E3372 modems is `36dd`. No logical devices are created in this usb configuration. You can work directly with raw device in libusb mode (specify key -u in command). Or you can connect option driver to this device and run the following command from the root:

```
echo "12d1 " >/sys/bus/usb-serial/drivers/option1/new_id
```

This will create a device `/dev/ttyUSBx` which can be used as a serial port (`-p` switch).


## Output of `fbrflash`:

```
Error opening device PID=36dd
```


## Output of `fbrflash -h`:

```
Utility to read flash modems on the balong platform.  
Modem must be in fastboot mode.

Usage:
  ./fbrflash [options]

The following options are allowed:

-p <tty>        - fastboot serial port in serial mode (by default /dev/ttyUSB0)
-u <pid>        - PID of USB device fastboot in libusb mode
-m              - show partition map
-n              - show nand flash settings
-t <file>       - take partition table from specified file instead of reading from modem
-o              - read from OOB (in the format 2048+64), without option - only data for B315 it is read in "raw" format
-y              - read with tag yaffs2 (in format 2048+16 or 4096+16)

  --- Read mode selection ---

-f #            - read partition with specified number, key can be specified more than once
-r start[:len]  - read block len from block start (by default len=1)
without option -r and -f - read all sections of the modem
```
