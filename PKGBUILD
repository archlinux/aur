pkgname=iscfpc
pkgver=1.0.10
pkgrel=20
pkgdesc="project maintain tool for FreePascal"
arch=('x86_64')
url=https://github.com/isyscore/isc-fpbase
license=('MPL')
depends=()
source=("http://yugioh.vip:9000/static/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('54efd48506da9e5f31b513cba28e4435')
validpgpkeys=()

package() {
    cd "$srcdir"
    if [ ! -d "$pkgdir/usr/bin" ]; then
        mkdir -p "$pkgdir/usr/bin"
    fi
    make DESTDIR="$pkgdir" install
}
