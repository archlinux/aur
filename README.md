The cp210x driver is natively support by mainline kernel. So if you just want
to use cp210x normally, this package is not for you.

From the specification of silabs, it clearly states that the maximum baud rate
of cp2102 is only 1Mbps. But, some cp2102 chips can indeed support 1.5MHz
baudrate and the driver provided by silabs for Windows is also support 1.5MHz
baudrate. So this DKMS modules is for that.

I'm not sure if there is any problem or will it do any damage to you hardware
with this "over clock". So Use it with care.

To take effect please reload the cp210x by:

```
$ modprobe -r cp210x
$ modprobe cp210x
```

-------------------------------------------------

On version 0.2, we try to download source code at DKMS stage.

* Pros:
    * Easy to maintain: The cp210x.c match the kernel version, we do not need to
    care about the LTS or any other legacy version of Linux kernel.
* Cons:
    * Internet is prerequisite, whenever triggering DKMS.

To satisfy the critical situation, you can go to /usr/src/cp210x-0.2/, and
copy cp210x_v6.16.c or cp210x_v6.17 to `./cp210x_v$kernel_base_version.c`,
where the `kernel_base_version` is the kernel version without the suffix
starting from -. Then recall the DKMS process

```sh
dkms install --no-depmod cp210x/0.2
```
