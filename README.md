# Gmail-Tray

Minimal Gmail notifier, with tray-icon, unread counter, opening the gmail page on a browser (firefox).

It mostly uses [fetchmail](https://www.fetchmail.info) to search for new emails and notify you, so you the main credits go for it's creator

*   My main job was create an interface and set up the polling code, so that it checks for emails on terminal, notifies the user and update the unread emails count

Also, you must set it (fetchmail) up first for it to wirk

## Build from Source

> cd gmail-tray/src

> makepkg -fsirc

Or, if you have the tar file:

> sudo pacman -U gmail-tray-1.0-1-any.pkg.tar.zst

## Setting up fetchmail:

*   Enable Gmail IMAP
    *   In Gmail settings → "Forwarding and POP/IMAP" → Enable IMAP.
*   Create an app password
    *   Go to: [https://myaccount.google.com/apppasswords](https://myaccount.google.com/apppasswords)
    *   Type Gmail-Tray > Create
    *   Note it down
*   Edit the .fetchmailrc file (probably on your home folder)
    *   Make it like:
        *   poll imap.gmail.com with proto IMAP  
               user \<your gmail here>@gmail.com password \<Your App Password>  
               is \<your linux username> here  
               ssl

## Enable service autostart

> systemctl --user enable --now gmail-tray.service

## Uninstall

> sudo pacman -Rns gmail-tray

Customizations  
It's a simple python script (eventually I will remake it in rust),

So you if you build it from source, you could just add, remove and modify any functions and parameters easily.

You can increase or decrease the check interval, change the icon, and you can also change the browser and the flags used

```
 (like --new-tab, --safe-mode (to use without extensions and make it lighter), ...)
```

But then you you have to rebuild from source for it to work.