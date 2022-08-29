# penguins-eggs-arch

## Build and install penguins-eggs on Arch

### stable
Copy and paste follow instructions 
```
git clone https://aur.archlinux.org/penguins-eggs.git
cd penguins-eggs
makepkg -srcCi
```
### developer
Copy and paste follow instructions 
```
git clone https://github.com/pieroproietti/penguins-eggs-arch
cd penguins-eggs-arch
makepkg -srcCi
```


## Configuration (default)

```sudo eggs dad -d```

## add calamares installer (optional)
```sudo eggs calamares --install```

(*) Note: this option don't work at the moment on Arch.

## Create your first iso (default)
All the users will be removed from your live system.

```sudo eggs produce --fast```

### Create a live system including all users
You can use the flag --clone, all users will be saved uncrypted on the live.

```sudo eggs produce --fast --clone```

### Create a live system including all users crypted

You can add the flag --backup: all users will be saved crypted in a LUKS volume inside the live system. The users will be not accessible on the live, but will be restored with krill during installation.

```sudo eggs produce --fast --backup```

### More compressed?

```sudo eggs produce --max``` 



## Copy your iso image and boot the son of your system
You can use ventoy, simple USB with balena etcher or similar, iso file with proxmox ve, virtualbox, vmware etc.


# Develop and collaborations link
* facebook group: [facebook group](https://www.facebook.com/groups/128861437762355)
* telegram: [telegram penguin's eggs](https://web.telegram.org/z/#-1447280458)
* penguins-eggs [sources](https://github.com/pieroproietti/penguins-eggs)
* penguins-eggs [book](https://penguins-eggs.net/book/)
* penguins-eggs [blog](https://penguins-eggs.net)