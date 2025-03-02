SysBoost

SysBoost is a simple but effective system optimizer for Linux.
it cleans junk, optimizes RAM, and improves CPU performance without bloat.
it’s written in pure bash, runs fast, and does exactly what it says.

## features

    Junk Cleanup – Removes package cache and unnecessary system files.
    RAM Optimization – Frees up cached memory.
    CPU Optimization – Disables unnecessary background services.
    Scheduled Optimization – Automate cleanups.
    CLI-Only – No GUI, just a simple script.

## installation
Arch (AUR)

once it's up on AUR, install it with:
```sh
yay -S sysboost
```
## manual install (for any linux distro)
```sh 
git clone https://github.com/ayumu436/bash.git sysboost  
cd sysboost  
sudo cp sysboost.sh /usr/bin/sysboost  
sudo chmod +x /usr/bin/sysboost
```
## how to use
```sh
sysboost --clean              # Clean junk files  
sysboost --optimize-ram       # Free up memory  
sysboost --optimize-cpu       # Disable useless background services  
sysboost --schedule enable    # Enable scheduled cleanup  
sysboost --schedule disable   # Disable scheduled cleanup  
sysboost --uninstall          # Uninstall SysBoost  
sysboost --version            # Check version  
sysboost --help               # Show help  
```
## license

mit. use it however you want.

## contributing

got ideas? open an issue or send a pull request.

## support

If you run into issues or have ideas to improve SysBoost, open an issue on GitHub.
I’ll check it out when I get the chance.
