# Maintainer: Alex Virelles <thesnakewitcher@gmail.com>
_pkgname=mypeople
pkgname=$_pkgname-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple and modern contactbook(addressbook)"
arch=(x86_64)
url="https://github.com/TheSnakeWitcher/$_pkgname"
license=('MIT')
depends=(sqlite)
provides=($_pkgname)
source=($_pkgname::$url/releases/download/v$pkgver/$_pkgname)
md5sums=('SKIP')

package() {
    mkdir -p $pkgdir/$HOME/.local/share/$_pkgname
    install -Dm 755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
md5sums=('a22e0c261b38d232ef8f53c951cfe1b3')
