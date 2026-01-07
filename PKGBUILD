# Maintainer: Leonie Ain <me@koyu.space>

pkgname=breeze-chameleon
pkgver=1.0.0
pkgrel=1
pkgdesc="Breeze Chameleon Icons"
arch=('any')
url="https://github.com/L4ki/Breeze-Chameleon-Icons"
source=("https://github.com/L4ki/Breeze-Chameleon-Icons/archive/refs/heads/master.zip")
sha256sums=('4b2712a0206136bf8c61d0e001d7db4779ecab256a54bc66a99e5d6e31981978')
makedepends=('unzip')

package() {
    cd "$srcdir/Breeze-Chameleon-Icons-master"
    install -Dm755 -r "Breeze Chameleon Dark" "$pkgdir/usr/share/icons/Breeze-Chameleon-Dark"
    install -Dm755 -r "Breeze Chameleon Light" "$pkgdir/usr/share/icons/Breeze-Chameleon-Light"
    install -Dm755 -r "Breeze-Round-Chameleon Dark Icons" "$pkgdir/usr/share/icons/Breeze-Round-Chameleon-Dark"
    install -Dm755 -r "Breeze-Round-Chameleon Light Icons" "$pkgdir/usr/share/icons/Breeze-Round-Chameleon-Light"
    install -Dm755 -r "Chameleon-Symbolic-Dark-Icons" "$pkgdir/usr/share/icons/Chameleon-Symbolic-Dark"
}