# Maintainer: Leonie Ain <me@koyu.space>

pkgname=breeze-chameleon
pkgver=1.0.0
pkgrel=3
pkgdesc="Breeze Chameleon Icons"
arch=('any')
url="https://github.com/L4ki/Breeze-Chameleon-Icons"
source=("https://github.com/L4ki/Breeze-Chameleon-Icons/archive/refs/heads/master.zip")
sha256sums=('SKIP')
makedepends=('unzip')

package() {
    cd "$srcdir/Breeze-Chameleon-Icons-master"
    mkdir -p "$pkgdir/usr/share/icons"
    cp -r "Breeze Chameleon Dark" "$pkgdir/usr/share/icons/Breeze-Chameleon-Dark"
    cp -r "Breeze Chameleon Light" "$pkgdir/usr/share/icons/Breeze-Chameleon-Light"
    cp -r "Breeze-Round-Chameleon Dark Icons" "$pkgdir/usr/share/icons/Breeze-Round-Chameleon-Dark"
    cp -r "Breeze-Round-Chameleon Light Icons" "$pkgdir/usr/share/icons/Breeze-Round-Chameleon-Light"
    cp -r "Chameleon-Symbolic-Dark-Icons" "$pkgdir/usr/share/icons/Chameleon-Symbolic-Dark"
}