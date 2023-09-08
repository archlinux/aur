# README

AUR package that provides enhanced session support for the Hyper-V virtual machine.

Based on [linux-vm-tools](https://github.com/microsoft/linux-vm-tools/).

```bash
# install
yay -S hv-enhanced-session

# enable session
sudo systemctl enable --now hv-enhanced-session

# xrdp use xinit
echo -n "export DESKTOP_SESSION=plasma\nexec startplasma-x11" > ~/.xinitrc

# at first time need restart xrdp
sudo systemctl daemon-reload
sudo systemctl restart xrdp
```
