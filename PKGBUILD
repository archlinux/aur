pkgname=shorter
pkgver=2.1
pkgrel=0
pkgdesc="rename series to unified format"
arch=("any")
url="https://code.obermui.de/markus/$pkgname"
license=('GPL3+')
depends=('bash')
source=("$url/archive/v$pkgver.tar.gz")
sha1sums=('b2f245c4934ccdfa7694ace896fa69e4d8e5e295')

package() {
    mkdir -p $pkgdir/usr/bin/
    install -m755 $srcdir/$pkgname-$pkgver/src/$pkgname $pkgdir/usr/bin/$pkgname
}
