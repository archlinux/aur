# Filesystem-in-subdirectory hook for “mkinitcpio” #

This “mkinitcpio” hook mounts the root file system from a subdirectory rather
than the root directory of a partition. The “dir=” kernel parameter specifies
which subdirectory. A leading slash (/) is allowed but not necessary.

This allows multiple separate operating systems to be installed in a single
partition.
For example a single partition could contain
multiple OS filesystems and other shared files:

* /os/arch-x86-64/bin/
* /os/arch-x86-64/etc/
* . . .
* /os/arch-i686/bin/
* /os/arch-i686/etc/
* . . .
* /home/_user_/
* /os/debian/ (potentially)
* /os/win/WINDOWS/ (if a common filesystem was supported)

It is achieved by using a “bind mount” of the subdirectory.

## Installation ##

Add “dir” to the HOOKS list in /etc/mkinitcpio.conf:

    HOOKS+=" dir"

Add a “dir=” parameter to the kernel command line
(for example in /boot/grub/menu.lst).
The path is relative to the file system of the “root” device. For example:

> APPEND root=LABEL=_label_ dir=/os/arch-x86-64 ro

## Issues ##

It’s also useful to mount the whole partition somewhere as well
using /etc/fstab, although this means that
all the files under the mounted OS directory
will be visible under both mount points.
Although I have not seen any serious problems,
some programs complain about a circular file system loop:

> find: File system loop detected

> du: WARNING: Circular directory structure.  
> This almost certainly means that you have a corrupted file system.  
> NOTIFY YOUR SYSTEM MANAGER.  
