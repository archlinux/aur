# `systemd-keyscript`

`systemd-keyscript` is a package for archlinux that allows you to run keyscripts with the new `systemd-cryptsetup` system. 
Previously, those who wanted to run a script before having cryptsetup unlock a partition could specify a `keyscript=` option in crypttab,
but currently, that option isn't implemented with systemd (see https://github.com/systemd/systemd/pull/3007).

## Configuration

To run a keyscript before unlocking a mapping named `cryptname`, put your script in `/etc/systemd-keyscript/scripts/cryptname.sh`. 
Then enable `systemd-keyscript@cryptname.service`. 
Keep in mind that unlocking cryptdevices happens quite early when writing keyscripts.

## `mkinitcpio` 

Add the `sd-keyscript` to the hooks list before `sd-encrypt` in `/etc/mkinitcpio.conf`. 
Put your scripts in `/etc/systemd-keyscript/initramfs/scripts/` instead of `/etc/systemd-keyscript/scripts/`. 
There is no need to enable any systemd service for keyscripts running in the initramfs, as the mkinitcpio hook will detect files named `/etc/systemd-keyscript/initramfs/cryptname.sh` and enable `systemd-keyscript@cryptname.service` for you in the initramfs.
When running `mkinitcpio`, the entire folder `/etc/systemd-keyscript/initramfs/` will be copied as `/etc/systemd-keyscript/` into in the initramfs.

## Order

If `systemd-keyscript@cryptname.service` is enabled, it will run when `systemd-cryptsetup@cryptname.service` is activated, but the keyscript service runs 
before the cryptsetup service starts starts. 

## Maintainence intention

I will be maintaining this package for as long as neccesary. I'm able to say this because of how small it is (around 50 lines of code), so I don't expect it to be much effort. 
Use this package knowing that any bugs will be fixed, and any issues and PRs will be reviewed in a timely manner. 
