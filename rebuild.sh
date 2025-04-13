rm -rf src
rm -rf pkg
rm *.pkg.tar.zst
rm *.tar.xz
makepkg --printsrcinfo > .SRCINFO
