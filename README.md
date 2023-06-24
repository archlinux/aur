# pyNotify
A gnome shell (wayland) notifier for Gotify server.

Gotify server is open source software for notifications that can be deployed on-prem (self-hosted). 
It provides web based service, API,  and also mobile application, but I was missing a working gnome tray notification app for receiving those notifications directly in my gnome desktop (wayland), so I build this.

## 1.Requirements
Built on Python 3.11

It also requires "Ayatana AppIndicator3" and Gnome shell extension "AppIndicator and KStatusNotifierItem Support".

The Gnome shell extension "AppIndicator and KStatusNotifierItem Support" can be installed from : https://extensions.gnome.org/extension/615/appindicator-support/

And finally, it also requires "notify-send" in the case of debian (installed with the libnotify-bin package from debian repos)


### 2.Installation

### 2.1.Installing the release package (precompiled)

#### 2.1.A.Installing the prerequisites for running the package
Install the prerequisites for your distribution:

- Arch :

        sudo pacman -S libappindicator-gtk3
  
- Debian 12 :

        sudo apt install libnotify-bin

        sudo apt install libappindicator3-dev

        sudo apt install libcairo2-dev libjpeg-dev libgif-dev

        sudo apt install libgirepository1.0-dev
 
- RedHat 9/Fedora :

        sudo dnf install libappindicator-gtk3

        sudo dnf install pkg-config python3.11-devel

#### 2.1.B.Installing the precompiled ZIP release package

Download the precompiled release package ZIP file for your distribution and copy it's contents to /opt/pyNotify. 
This release package has a binary already compiled and ready to execute on Linux.
The bash script (install.sh) inside the realease package will copy all the necessary files to /opt/pyNotify in one go.....

....just edit the file pyNotify.conf in that destination folder (/opt/pyNotify) and set the proper values for:
- gotify server url, and 
- gotify client token  (you may need to generate this in your Gotify server)

### 2.2.Installing from AUR (Arch Linux)
To install the application from AUR (Arch User Repo) you can use an AUR helper like yay and execute:
                
                yay -S pynotify-git

### 2.3.Installing from .deb package (Debian/Ubuntu/Mint/etc)
To install the application from the deb package in this repo releases you need to download the deb packaga and execute:

                sudo dpkg -i pyNotify.X.Y.deb

where X and Y are the release versions of the application



## 3.Building / Compiling from source
It's also possible to compile from source code in python (pyNotify.py).

I'm providing several bash scripts to build / compile with pyinstaller the python file:
- build.<Distro>.sh : just installs dependencies for <Distro> distro and compiles the python file (pyNotify.py) generating the binary in a "dist" folder
- install.sh: just copies the resulting compiled files to /opt/pyNotify and creates the pyNotify.desktop file in your $HOME/.local./share/applications
- build.and.install.sh: combination of both
- install.binaries.sh: do not use this....itś meant to be copied into the dist folder to install the resulting compiled files to /opt/pyNotify
  
### 3.1.Dependencies for building / compiling
Please make sure you install these dependencies before building on your own (IN THE CASE OF NOT using the build.<Distro>.sh provided)

- Arch :

      sudo pacman -S python3
  
      sudo pacman -S python-pip

      sudo pacman -S libappindicator-gtk3
  
- Debian 12 :

      sudo apt install libnotify-bin

      sudo apt install python3.11-venv
  
      sudo apt install python3-pip

      sudo apt install libappindicator3-dev

      sudo apt install libcairo2-dev libjpeg-dev libgif-dev

      sudo apt install libgirepository1.0-dev
  
  
- RedHat 9/Fedora :

      sudo dnf install libappindicator-gtk3

      sudo dnf install python3.11-* # (all packages) or just...
  
                      sudo dnf install python3.11-venv
  
                      sudo dnf install python3.11-pip
  
                      sudo dnf install pkg-config python3.11-devel

