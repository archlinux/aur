# Maintainer: Alex Virelles <thesnakewitcher@gmail.com>
_pkg=mypeople
pkgname=$_pkg-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple and modern contactbook/addressbook"
arch=(x86_64)
url="https://github.com/TheSnakeWitcher/$_pkg"
license=('MIT')
depends=(sqlite)
provides=($_pkg)
source=($url/releases/download/v$pkgver/$_pkg)
md5sums=('SKIP')

package() {
    install -o "$USER" -d "$pkgdir/$HOME/.local/share/$_pkg"
    install -Dm 755 "$srcdir/$_pkg" "$pkgdir/usr/bin/$_pkg"
}
