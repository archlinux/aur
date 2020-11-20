# Maintainer: Florian Walsh

pkgname=cocoa
pkgver=5.3.3
pkgrel=1
pkgdesc="A computer algebra system for doing computations in commutative algebra."
arch=('i686' 'x86_64')
url="http://cocoa.dima.unige.it/"
license=('GPL')
depends=()
source=("http://cocoa.dima.unige.it/download/bin/cocoa-5.3.3-linux.tgz" "cocoa5")
sha256sums=('f7bf962cec26f66a0ef6f0844546c507e68d74c1fe6778b4a289d70fcc0ab97f'
            'a1752090a5afb150543ada48a046d23d4ba80cb56bc15713a27dd4036e7c964c')

package() {
    install -d "$pkgdir/opt/cocoa"
    cp -r $srcdir/cocoa-5.3/. $pkgdir/opt/cocoa
    install -d "$pkgdir/usr/bin"
    install $srcdir/cocoa5 "$pkgdir/usr/bin/cocoa5"
}
