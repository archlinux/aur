. <(grep -e^{,_}pkgver= PKGBUILD|tr - _)
sed -i /^pkgver=/s/=.*/=$_pkgver/`[ $pkgver = $_pkgver ] || echo \;/^pkgrel=/s/=.*/=1/` PKGBUILD
CARCH=x86_64 makepkg --printsrcinfo>.SRCINFO
