### Officially migrated to Codeberg! Hopefully, now I won't have to update 2 repositories after an update.

## Depends on [fzf](https://github.com/junegunn/fzf?tab=readme-ov-file#installation)

## hyconf is available on the Arch User Repository!
1 - Install with an AUR helper of your choice:<br/>
`$ yay -S hyconf`<br/>
`$ paru -S hyconf`

2 - or install manually with:
1. `$ git clone https://aur.archlinux.org/hyconf.git`
2. `$ cd hyconf`
3. `$ makepkg -si`

------------------------------

## On first launch
will ask you for your preferred editor's command (nvim, vi, nano, etc).

```bash
~ $ hyconf
Enter your preferred editor command (e.g., nano, vim, code): 
```

## When used
will list all files and directories in `$HOME/.config/hypr` and, after choosing a configuration file, will open that file with previously chosen editor.
That's all.

```bash
~ $ hyconf
> Choose a file to open with nvim                                                                                                                
────────────
▌ ./hyprpaper.conf                                                                                                
▌ ./pyprland.toml                                                                                                 
▌ ./hyprland.conf                                                                                                 
▌ sources/env.conf                                                                                                
▌ sources/wallpaper.conf                                                                                          
▌ sources/binds.conf                                                                                              
▌ sources/plugin.conf                                                                                             
▌ sources/start.conf                                                                                              
▌ sources/vars.conf                                                                                               
▌ sources/perms.conf                                                                                              
▌ sources/rules.conf                                                                                              
▌ sources/defs.conf                                                                                               
▌ ./keyring.conf
```
