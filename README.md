# README

AUR package that provides enhanced session support for the Hyper-V virtual machine. Based on [linux-vm-tools](https://github.com/microsoft/linux-vm-tools/).

## Installation

```bash
# install
yay -S hyperv-enhanced-session

# enable session
sudo systemctl enable --now hyperv-enhanced-session

# xrdp reads .xinitrc
echo "/usr/lib/plasma-dbus-run-session-if-needed startplasma-x11" > ~/.xinitrc
chmod +x ~/.xinitrc

# restart xrdp if service already started
sudo systemctl daemon-reload
sudo systemctl restart xrdp
```

## Hyper-V Settings

Setup Hyper-V Transport using PowerShell:

```ps
Set-VM -VMName "VM NAME" -EnhancedSessionTransportType HvSocket
```

U should `Default Switch` as `Network Adapter`.

## Links

* [Arch Wiki: Xrdp]( https://wiki.archlinux.org/title/xrdp)
* [Setup Hyper-V enhanced session for Ubuntu 20](https://gist.github.com/milnak/54e662f88fa47a5d3a317edb712f957e)
