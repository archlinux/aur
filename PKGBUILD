# Contributor: Alexander Jenisch <nt@divzero.at>
# Contributor: Xyne

pkgname=festival-freebsoft-utils
pkgver=0.10
pkgrel=2
arch=('any')
pkgdesc="collection of Festival utilities including modules for speech-dispatcher support"
license=('GPL2')
depends=('sox' 'festival')
makedepends=('pkgconfig')
provides=("festival-freebsoft-utils=$pkgver")
conflicts=("festival-freebsoft-utils-cvs")
options=('!libtool')
url="http://www.freebsoft.org/festival-freebsoft-utils"
source=("http://www.freebsoft.org/pub/projects/festival-freebsoft-utils/$pkgname-$pkgver.tar.gz")

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -dm755 "$pkgdir/usr/share/festival/"
  install -Dm644 -t "$pkgdir/usr/share/festival/" *.scm
}
sha256sums=('c16cbd1d5494b1b058b787ef936fa483ac2f3ce92657372c92b3dbf153750457')
