# penguins-eggs-arch

This repository exists in two forms, an stable one on AUR and a development one on github

* https://aur.archlinux.org/packages/penguins-eggs (stable)
* https://github.com/pieroproietti/penguins-eggs-arch (devel)

# Build and install penguins-eggs
This PKGBUILD works in both Arch and Manjaro and could with your cooperation be further extended to other derivatives.

## stable
Copy and paste the following instructions:

```
git clone https://aur.archlinux.org/penguins-eggs.git
cd penguins-eggs
makepkg -srcCi
```

## developer
Copy and paste the following instructions:


```
git clone https://github.com/pieroproietti/penguins-eggs-arch
cd penguins-eggs-arch
makepkg -srcCi
```

# Configuration
You can configure eggs with the default settings, simply with the command:

```sudo eggs dad -d```

# add calamares installer (optional)
To add the calamares GUI installer, type:

```sudo eggs calamares --install```

**Note:** while for Manjaro we can refer to the official version of the distribution, in the case of Arch we can relay just on the repository https://github.com/pieroproietti/penguins-calamares-arch  which may occasionally be broken.

## Create your first iso
All the users will be removed from your live system.

```sudo eggs produce```

### Create a live system including all users
You can use the flag --clone, all users will be saved uncrypted on the live.

```sudo eggs produce --clone```

### Create a live system including all users crypted
Or you can use the --cryptedclone flag, all users will be saved encrypted in a LUKS volume within the live image. The user data will not be available in live mode, but can be reinstalled using the CLI installer.

```sudo eggs produce ----cryptedclone```

### Would you like a more compressed image?
Just add flag --max:

```sudo eggs produce --max``` 

### Do you want eggs and calamares removed after installation?
Just add flag --release:

```sudo eggs produce --max --release``` 

# Boot the image
You can use: [Ventoy](https://www.ventoy.net/en/index.html), Balena etcher, Rufus or similar on USB key, or use the iso file with [Proxmox VE](https://www.proxmox.com/en/proxmox-ve), Virtualbox, vmware, etc.

# Binaries
It would be very useful to have the binaries for penguins-eggs and calamares freely created and shared by the community from the PKGBUILDs in AUR, if anyone wants to help can contact [me](https://t.me/penguins_eggs).

# More informations
There is a [Penguins' eggs official book](https://penguins-eggs.net/book/) and same other documentation - mostly for developers - on [penguins-eggs repo](https://github.com/pieroproietti/penguins-eggs) under **documents** and **i386**, in particular we have [hens, differents species](https://github.com/pieroproietti/penguins-eggs/blob/master/documents/hens-different-species.md) who descrive how to use eggs in manjaro.

You can contact me by [mail](mailto://pieroproietti@gmail.com) or follow me on 
[blog](https://penguins-eggs.net), 
[facebook](https://www.facebook.com/groups/128861437762355/), 
[github](https://github.com/pieroproietti/penguins-krill), 
[jtsi](https://meet.jit.si/PenguinsEggsMeeting), 
[reddit](https://www.reddit.com/user/Artisan61), 
[telegram](https://t.me/penguins_eggs), 
[twitter](https://twitter.com/pieroproietti).

# Copyright and licenses
Copyright (c) 2017, 2023 [Piero Proietti](https://penguins-eggs.net/about-me.html), dual licensed under the MIT or GPL Version 2 licenses.
