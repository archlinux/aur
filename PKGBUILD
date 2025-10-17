pkgname=argfetch
pkgver=1.0
pkgrel=1
pkgdesc="FETCH ARGENTINO"
pkgbase=argfetch
arch=('x86_64')
url="https://github.com/f3d31206/rafetch.git"
license=('GPL')
depends=()
source=("fetch.sh")
md5sums=('SKIP')  # o el hash correspondiente


package() {
    install -Dm755 "$srcdir/$srcname/$pkgname-$pkgver/fetch.sh" "$pkgdir/usr/bin/fetch"  # Cambia la ruta según sea necesario
}
