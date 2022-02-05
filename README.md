Build package manually
$ makepkg -si

Update .SRCINFO
$ makepkg --printsrcinfo > .SRCINFO

This should be done every time the source changes. Your source should change with pkgver.
$ updpkgsums
