export CARCH=x86_64
. PKGBUILD
sed -i /^pkgver=/s/=.*/=`pkgver`/ PKGBUILD
makepkg --printsrcinfo>.SRCINFO
