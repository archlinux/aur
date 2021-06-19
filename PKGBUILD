pkgname=iscfpcx
pkgver=1.0.9
pkgrel=18
pkgdesc="project maintain tool for FreePascal"
arch=('x86_64')
url=https://github.com/isyscore/isc-fpbase
license=('MPL')
depends=('fpc>=3.2.0')
source=("http://yugioh.vip:9000/static/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('520ea541498279e134a639be31b47f07')
validpgpkeys=()

package() {
    cd "$srcdir"
    if [ ! -d "$pkgdir/usr/bin" ]; then
        mkdir -p "$pkgdir/usr/bin"
    fi
    make DESTDIR="$pkgdir" install
}
