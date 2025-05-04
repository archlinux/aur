# Update Guide

1. Update `PKGBUILD`, set new version
2. Run `makepkg -g` to generate SHA
3. Update SHA in `PKGBUILD`
4. Generate SRCINFO `makepkg --printsrcinfo > .SRCINFO`