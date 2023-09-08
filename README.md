# README

AUR package that provides enhanced session support for the Hyper-V virtual machine. Based on [linux-vm-tools](https://github.com/microsoft/linux-vm-tools/).

## Installation

```bash
# install
yay -S hv-enhanced-session

# enable session
sudo systemctl enable --now hv-enhanced-session

# read https://wiki.archlinux.org/title/xrdp
echo -n "export DESKTOP_SESSION=plasma\n/usr/lib/plasma-dbus-run-session-if-needed startplasma-x11" > ~/.xinitrc
chmod +x ~/.xinitrc

# restart xrdp if service already started
sudo systemctl daemon-reload
sudo systemctl restart xrdp
```

## Hyper-V Settings

Use `Default Switch`.

Setup Hyper-V Transport:

```ps
Set-VM -VMName "<YOUR VM NAME>" -EnhancedSessionTransportType HvSocket
```

## Links

* [Setup Hyper-V enhanced session for Ubuntu 20](https://gist.github.com/milnak/54e662f88fa47a5d3a317edb712f957e)
