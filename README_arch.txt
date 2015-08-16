=======
INSTALL
=======

grub4dos supported filesystems: ext2, ext3, ext4, ntfs, fat, fat32

Assume /dev/sdd is your bootable usb device.
Assume /mnt/sdd1 is your boot partition mount point

------
STEP 1
------

Install first stage boot loader to MBR of /dev/sdd:
# bootlace.com --no-backup-mbr --mbr-disable-floppy --time-out=0 /dev/sdd

grub4dos supports automatic backups of the original MBR by default:
# bootlace.com --mbr-disable-floppy /dev/sda

Then, if you need to restore the original MBR, press SPACE during grub
loading prompt.

NOTE: Use bootlace64.com instead of bootlace.com in x86_64 systems.

------
STEP 2
------

Copy the grldr file to the mounted device:
$ cp /grub/grldr /mnt/sdd1/

NOTE: Target directory (/mnt/sdd1) only supports FAT/NTFS/ext2 (not ext4)

------
STEP 3
------

Create a grub directory on the mounted device:
$ mkdir -p /mnt/sdd1/grub
$ cp /grub/menu.lst /mnt/sdd1/grub

There is additional documentation about menu.lst configs in /usr/share/doc/grub4dos

grub4dos manual: http://diddy.boot-land.net/grub4dos/Grub4dos.htm

-----------------
STEP 4 (optional)
-----------------

If you want to use 'default' option in menu.lst:
$ cp /grub/default /mnt/sdd1/grub

-----------------
STEP 5 (optional)
-----------------

If you want to use Windows boot.ini/bootmgr.ini to chain grub4dos bootloader:
$ cp /grub/grub.exe /mnt/sda1/grub
