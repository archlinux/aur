# Wakeup Triggers 

This project is basically a [systemd](https://wiki.archlinux.org/index.php/Systemd) unit file that calls a simple script that disable all wakeup triggers but the ones specified by the user in a [config file](wakeup-triggers.conf).

This is useful when the file ``/proc/acpi/wakeup`` has a lot of wakeup triggers enable by default. This can cause the system to resume from suspension very easy (like when a USB device is unplugged).

This problem is listed [here](https://wiki.archlinux.org/index.php/Power_management/Suspend_and_hibernate#Instantaneous_wakeups_from_suspend) in the Arch Wiki article about System Suspension and Hibernation and the script used here was based on the work-around solution described there.

The "start" function of the script [wakeup-triggers.sh](wakeup-triggers.sh) disable all the default enabled triggers leaving just the ones the user wants, specified in the config file. The "stop" function of the script restores the original triggers.

To discover what triggers your system supports, take a look at the file ``/proc/acpi/wakeup``. Each line represents a trigger. There you can see also which of them are enabled by default in your system. Once you decide which ones you want to be activated by this service, put in the [config file](wakeup-triggers.conf) the name of the associated device (the letters in the first column of the line, eg. "PWRB" for the power button press or "LID" for the laptop's lid opening).

The config file is placed in ``/etc/wakeup-triggers.conf``. It came with two triggers enabled by default, the power button (PWRB) and the LID (LID0) for laptops. The sleep button (SLPB) is commented with '#' and will not be enable. This is just to show how you can activate and deactivate triggers easily by commenting the lines (putting or removing the '#'). After changing the config file, the service must be restarted. It can be done by systemd by typing ``sudo systemctl restart wakeup-triggers.service``.

This project has a [PKGBUILD](https://wiki.archlinux.org/index.php/PKGBUILD) file that can be used to create a package with [makepkg](https://wiki.archlinux.org/index.php/Makepkg). The package can be then installed with [pacman](https://www.archlinux.org/pacman) on a Arch Linux system.

In order to the script run on every boot, the [wakeup-triggers.service](wakeup-triggers.service) unit must be enable in systemd.

So, to clone, package, install and enable this project, just run:

```
git clone https://gitlab.com/saviocmc/wakeup-triggers.git
cd wakeup-triggers
makepkg -ci
sudo systemctl enable wakeup-triggers.service
```

The script should now run on next boot

It is also available in the Arch Linux User Repository (AUR) under https://aur.archlinux.org/packages/wakeup-triggers

You can install it with [yay](https://github.com/Jguer/yay): `yay -S wakeup-triggers`

or with any other [AUR helper](https://wiki.archlinux.org/index.php/AUR_Helpers) of your choice.
