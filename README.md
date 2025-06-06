# Gmail-Tray

Minimal Gmail notifier, with tray-icon, unread counter, opening the gmail page on a browser.

## Build from Source

> cd gmail-tray/src

> makepkg -fsi

Or, if you have the tar file:
> sudo pacman -U gmail-tray-1.0-1-any.pkg.tar.zst


## enable service autostart

> systemctl --user enable --now gmail-tray.service

## Uninstall

> sudo pacman -R gmail-tray

Customizations
It's a simple python script (eventually I will remake it in rust),

So you could just add, remove and modify any functions and parameters easily.

     Including reusing this code for any other site you want a notifier (just change the URL).

You can increase or decrease the check interval, change the icon, and you can also change the browser and the flags used

     (like --new-tab, --safe-mode (to make it lighter), ...)

I actually started doing this with surf, because it's so light, but it doesn't allow for dark mode.
