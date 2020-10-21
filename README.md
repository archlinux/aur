makepkg --install
sha256sum jcloisterzone-5.0.15.deb
makepkg --printsrcinfo > .SRCINFO

git add .SRCINFO PKGBUILD   
