export CARCH=x86_64
makepkg --printsrcinfo>.SRCINFO
. PKGBUILD
sed -i "/\tpkgver =/s/=.*/= `pkgver`/" .SRCINFO
