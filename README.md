# Gmail-Tray

Minimal Gmail notifier, with tray-icon, unread counter, opening the gmail page on a browser (firefox).

It mostly uses [fetchmail](https://www.fetchmail.info) to search for new emails and notify you, so you the main credits go for it's creator

*   My main job was create an interface and set up the polling code, so that it checks for emails on terminal, notifies the user and update the unread emails count

Also, you must set it (fetchmail) up first for it to wirk

## Build from Source

> cd gmail-tray

> makepkg -fsirc

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
The user config file is in ~/.config/gmail-tray/gmail-tray-configs.json

There, you can change:

*   The checking interval to run fetchmail,
*   The browser used to open gmail (to the one you like most),
*   The flags used to open the browser

```
 (like --new-tab, --safe-mode (to use without extensions and make it lighter), ...),
```

*   The path to the gmail-tray icon (to another icon perhaps),
*   The app's title,
*   And even the link to open (if you, for some reason, want to open an alternative page instead of gmail)