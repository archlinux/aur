pkgname=iscfpc
pkgver=1.1.0
pkgrel=22
pkgdesc="project maintain tool for FreePascal"
arch=('x86_64')
url=https://github.com/isyscore/isc-fpbase
license=('MPL')
depends=()
source=("http://yugioh.vip:9000/static/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('df6c3b41b4a6052ab9d3abb90468db50')
validpgpkeys=()

package() {
    cd "$srcdir"
    if [ ! -d "$pkgdir/usr/bin" ]; then
        mkdir -p "$pkgdir/usr/bin"
    fi
    make DESTDIR="$pkgdir" install
}
