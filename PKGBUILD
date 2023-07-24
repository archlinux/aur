# Maintainer: Alex Virelles <thesnakewitcher@gmail.com>
_pkgname=mypeople
pkgname=$_pkgname-bin
pkgver=0.0.3
pkgrel=1
pkgdesc="A simple and modern contactbook(addressbook)"
arch=(x86_64)
url="https://github.com/TheSnakeWitcher/$_pkgname"
license=('MIT')
depends=(sqlite3)
makedepends=(make)
source=($_pkgname::$url/releases/download/v$pkgver/$_pkgname)
md5sums=('7ee01430171f8d88d99d154911577120')

package() {
    mkdir -p $pkgdir/$HOME/.local/share/$_pkgname
    install -Dm755 $srcdir/$_pkgname $pkgdir/usr/bin/$_pkgname
}
