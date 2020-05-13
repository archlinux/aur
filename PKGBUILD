# Maintainer: Florian Walsh

pkgname=cocoa
pkgver=5.3.2
pkgrel=1
pkgdesc="A computer algebra system for doing computations in commutative algebra."
arch=('i686' 'x86_64')
url="http://cocoa.dima.unige.it/"
license=('GPL')
depends=()
source=("http://cocoa.dima.unige.it/download/bin/cocoa-5.3.2-linux.tgz" "cocoa5")
sha256sums=('3f0b2a5916c756b91db9d6f2d60a18c26b60c32dc68f65c343c4d4016a8d7f52'
            'a1752090a5afb150543ada48a046d23d4ba80cb56bc15713a27dd4036e7c964c')

package() {
    install -d "$pkgdir/opt/cocoa"
    cp -r $srcdir/cocoa-5.3/. $pkgdir/opt/cocoa
    install -d "$pkgdir/usr/bin"
    install $srcdir/cocoa5 "$pkgdir/usr/bin/cocoa5"
}
