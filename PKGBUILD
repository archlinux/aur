pkgname=shorter
pkgver=2.1
pkgrel=2
pkgdesc="rename series to unified format"
arch=("any")
url="https://code.obermui.de/markus/$pkgname"
license=('GPL3+')
depends=('bash')
source=("$url/archive/v$pkgver.tar.gz")
sha1sums=('a67ba50da49a78e46b4e5c894be028f25b62347c')

package() {
    mkdir -p $pkgdir/usr/bin/
    install -m755 $srcdir/$pkgname/src/$pkgname $pkgdir/usr/bin/$pkgname
}
