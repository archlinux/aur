# THE BACKGROUND:

Linode (http://www.linode.com) is a VPS host which supports Arch Linux servers and custom kernels. This project gives you an Arch kernel for your Linode.

# THE PROBLEM:

Linode does not distribute their kernel configs - you have to boot into one and read /proc/config.gz. Arch's vanilla x86_64 will boot, but is full of drivers you will never ever use on a Linode. Arch's i686 will not work at all.

# THE SOLUTION:

This package provides a working, semi-minimalist kernel. It boots and is fine to run as-is for most things. (I do!) It can also be your starting point for tweaking.

Configs are a compromise between vanilla Linode and Arch. Most drivers are disabled, while a lot of ciphers and net stuff are inline. Few actual modules are left. This is not to everyone's taste, so hack away.

# GRUB MENUS INCLUDED

* For Xen linodes (which are deprecated but still exist) we have `/boot/grub/menu.lst`. Configure your linode to boot with a pv-grub kernel, and it should just work. If not, please report a bug. You do NOT need to install the grub-legacy package (it will conflict).
* For KVM (all new linodes), we have `/etc/grub.d/08_linux_linode`. The post-install hook will automatically regenerate a grub config with linux-linode as the first option. Configure your linode to boot with "GRUB2".
* If your KVM linode has been migrated from an older Xen linode, you may also need to set the following options in `/etc/default/grub`:

      GRUB_TERMINAL=serial
      GRUB_DISABLE_OS_PROBER=true
      GRUB_SERIAL_COMMAND="serial --speed=19200 --unit=0 --word=8 --parity=no --stop=1"
      GRUB_DISABLE_LINUX_UUID=true
      GRUB_GFXPAYLOAD_LINUX=text

   You may want to remove `quiet` from `GRUB_CMDLINE_LINUX_DEFAULT` as well.

   After you've configured grub, you will need to regenerate the config file: `sudo grub-mkconfig -o /boot/grub/grub.cfg`

   You may also need to install grub files to /boot: `grub-install --no-bootsector --boot-directory=/boot /dev/null`

   Take extra care to make sure you're booting from the correct device name. Xen devices are called /dev/xvda while KVM devices are called /dev/sda. If you're running grub inside your old Xen linode, it will automatically add "root=/dev/xvda" to your kernel line in /boot/grub/grub.cfg. Once you migrate to KVM, this will no longer work. You'll have to either edit this file by hand before shutting down to migrate, or edit it using the interactive grub command line afterwards. Once you've migrated, running grub-mkconfig again should fix it. Also be sure to check /etc/fstab or /etc/crypttab for any other device names that might give you boot problems.

# STEPS TO USE

1. pacman -Syu
1. pacman -U $pkgfile
1. if you've recently migrated from xen to kvm, check your grub options (see above)
1. reboot your linode into pv-grub (xen) or GRUB2 (kvm)
1. report bugs ;)
