# Maintainer: Florian Walsh

pkgname=cocoa
pkgver=5.4.0
pkgrel=3
pkgdesc="A computer algebra system for doing computations in commutative algebra."
arch=('i686' 'x86_64')
url="http://cocoa.dima.unige.it/"
license=('GPL')
depends=()
source=("http://cocoa.dima.unige.it/cocoa/download/bin/cocoa-5.4.0-linux.tgz" "cocoa5")
sha256sums=('5185e0fde61addb5803f09b78c2a611bf5cd7395443b5add2eb0e51cdb619578'
            'a1752090a5afb150543ada48a046d23d4ba80cb56bc15713a27dd4036e7c964c')

package() {
    install -d "$pkgdir/opt/cocoa"
    cp -r $srcdir/cocoa-5.4/. $pkgdir/opt/cocoa
    install -d "$pkgdir/usr/bin"
    install $srcdir/cocoa5 "$pkgdir/usr/bin/cocoa5"
}
