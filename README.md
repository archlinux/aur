# xbox-generic-controller

### Fix for generic XBox-like USB gamepads that are recognized but not functional.

This is an AUR wrapper for the [python script by dnmodder](https://gist.github.com/dnmodder/de2df973323b7c6acf45f40dc66e8db3) using a udev rule to run the script automatically when plugged in and blacklisting the `xpad` kernel module.

# Will this work for my controller?

If you have a generic XBox USB controller with vendorid:productid `045e:0283`, then probably yes. Plug in your controller, then run this to find out:

```
$ lsusb
```

I haven't tested this anywhere but my own laptop, so please [open an issue or submit a pull request](https://gitlab.com/ryanobeirne/xbox-generic-controller) if you have any problems.

# Install

## ArchLinux

### Using pacman

```
$ git clone https://gitlab.com/ryanobeirne/xbox-generic-controller
$ cd xbox-generic-controller
$ makepkg -si
```

### Using yay

```
$ yay -S xbox-generic-controller
```

You may need to reboot or run:

```
# udevadm control --reload
```

# Dependencies

`xboxdrv`

- A userspace driver for xbox controllers

`python3`

- The magic is in the [python script by dnmodder](https://gist.github.com/dnmodder/de2df973323b7c6acf45f40dc66e8db3).

`python-pyusb`

- A python USB library

`systemd`

- Uses a udev rule to run a script when the controller is plugged in


