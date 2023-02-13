# Kde-Dolphin-ISO-Mount

Mounting ISOs like windows in userspace over right click - sub menu

# Install

```bash
cd ~/ \
git clone gitea@gitea.miluriel.info:FirstMiluerer/Kde-Dolphin-ISO-Mount.git \
cd Kde-Dolphin-ISO-Mount || exit \
mkdir -p ~/.local/share/kservices5/ServiceMenus/ \
mkdir -p ~/.local/bin/isomount/ \
cp .local/share/kservices5/ServiceMenus/mount-iso.desktop ~/.local/share/kservices5/ServiceMenus/ \
chmod 1600 ~/.local/share/kservices5/ServiceMenus/mount-iso.desktop \
cp .local/bin/isomount.sh ~/.local/bin/isomount \
rm -rf ~/Kde-Dolphin-ISO-Mount \
```

# Uninstall

```bash
rm ~/.local/share/kservices5/ServiceMenus/mount-iso.desktop
rm ~/.local/bin/isomount
```