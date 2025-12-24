updpkgsums ; makepkg --printsrcinfo > .SRCINFO ; git add PKGBUILD .SRCINFO ; git commit -m "change dependencies" ; git push
