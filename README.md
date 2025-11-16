# Update Guide

1. Update `PKGBUILD`, set new version
2. Delete untracked git files
3. Run `makepkg -g` to generate SHA
4. Update SHA in `PKGBUILD`
5. Generate SRCINFO `makepkg --printsrcinfo > .SRCINFO`