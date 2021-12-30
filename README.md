# AUR Package for Conduktor

## Manually upgrade version

1. Change version
2. Generate Shasums : makepkg -g -f -p PKGBUILD 
3. Generate SRCINFO : makepkg --printsrcinfo > .SRCINFO
4. Test package :  extra-x86_64-build 
5. Commit & Push

## Todo

- [ ] Base package on deb
- [ ] Extract icon from deb
- [ ] Use embedded java from deb
- [ ] Watch release repo from conduktor to allow automatic updates
