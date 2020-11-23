setenv bootargs "earlyprintk root=/dev/mmcblk0p2 rw rootwait console=ttyS2,115200n8 console=tty1 loglevel=0"

load ${devtype} ${devnum} ${fdt_addr_r} ${prefix}dtb/rk3288-tinker-s.dtb
load ${devtype} ${devnum} ${kernel_addr_r} ${prefix}vmlinuz-linux-rockchip
if load ${devtype} ${devnum} ${ramdisk_addr_r} ${prefix}initramfs-linux-rockchip.img; then
    bootz ${kernel_addr_r} ${ramdisk_addr_r}:${filesize} ${fdt_addr_r}
else
    bootz ${kernel_addr_r} - ${fdt_addr_r}
fi

# Recompile with:
# mkimage -C none -A arm -T script -d /boot/boot.cmd /boot/boot.scr
