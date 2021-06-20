pkgname=iscfpc-aarch64
pkgver=1.0.10
pkgrel=20
pkgdesc="project maintain tool for FreePascal"
arch=('aarch64')
url=https://github.com/isyscore/isc-fpbase
license=('MPL')
depends=()
source=("http://yugioh.vip:9000/static/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('5716bd8d1696503f99cdbc61b55c4d08')
validpgpkeys=()

package() {
    cd "$srcdir"
    if [ ! -d "$pkgdir/usr/bin" ]; then
        mkdir -p "$pkgdir/usr/bin"
    fi
    make DESTDIR="$pkgdir" install
}
