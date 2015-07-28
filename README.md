hhk-emulate
===========
A xkb keyboard layout that emulates the layout of the happy hacking keyboard

Installation
------------

###Arch users
Install the package `xkeyboard-config-hhk` from the AUR

###Everyone else
  1. Download xkeyboard-config

  2. Apply `hhk.patch`

  3. `./configure` and `make`

  4. `make install` or just replace the patch affected files

Usage
-----
To temporarily change your layout:

  setxkbmap -layout us -variant hhk

To change your layout on boot create a new file in `/etc/X11/xorg.conf.d/` named something like `30-keyboard.conf` with contents similar to:
```
Section "InputClass"
  Identifier "Happily Hacked Keyboard"
  MatchDevicePath "/dev/input/event*"
  MatchIsKeyboard "on"
  Driver "evdev"

	 Option "XkbLayout" "us"
  Option "XkbVariant" "hhk"
EndSection
```

Contribute
----------
If you find anything that could use improving, submit a pull request or create
an issue.

