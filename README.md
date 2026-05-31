# ArchBrew
A lightweight package manager for Arch Linux and its derivatives that uses **Homebrew‑style syntax**, the familiar brew command, and supports both **AUR** and **official Arch repositories**.    
**ArchBrew** is **independent** - not a port or fork of Homebrew - but provides a similar workflow tailored for Arch systems.

# Usage
brew (COMMAND)    

Commands:     
  install  -  Install one or more packages     
  update  -   Update package databases     
  upgrade  -  Upgrade installed packages     
  search  -   Search for packages in Arch repos and/or AUR      
  info    -   Show package details     
  uninstall - Remove one or more packages     
  list   -    List installed packages     
  doctor  -   Run diagnostics for sync db count, local db path and if local package db is readable     
  help    -   Print this message or the help of the given subcommand(s)     
  clean    -  Clean ArchBrew cache
Options:     
-  -V, --version  Print version    
-  -l, --local    Use a local .pkg.tar.zst with a path specified (to be used only with install)    
Examples:   
```brew install firefox```    
```brew info code```

# Support
As the name suggests, **ArchBrew supports only Arch Linux and its derivatives**, including:
- CachyOS
- EndeavourOS
- Manjaro
- Garuda
- Any Arch-based distro
Because **ArchBrew** relies on Arch’s package infrastructure, it is not intended for non‑Arch systems.

# AUR & Official repositories
**ArchBrew** supports both:
- AUR packages
- Official Arch repositories
This allows you to install software from either source using a unified brew workflow.

# Installation (only on **Arch**)
Install it using paru -S archbrew or yay -S archbrew depending on your AUR helper.     

# Building ArchBrew
Using git: ```git clone https://github.com/Marmarek-here/ArchBrew.git && cd ArchBrew && makepkg -si```

# Changelog
1.1.0 - Added cache, bubblewrap and brew clean (cache is at /var/tmp/archbrew-cache/YOUR_USERNAME)
1.0.x - Bugfixes
1.0.0 - FIRST STABLE RELEASE (it was made at night enthusiasm)