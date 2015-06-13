# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=sickle
pkgver=1.33
pkgrel=1
pkgdesc="Windowed Adaptive Trimming for fastq files using quality"
arch=('i686' 'x86_64')
url="https://github.com/najoshi/sickle"
license=('custom')
depends=('zlib')
source=(https://github.com/najoshi/sickle/archive/v$pkgver.tar.gz)
md5sums=('9e2ba812183e1515198c9e15c4cd2cd7')

build() {
  cd "$srcdir/sickle-$pkgver"

  make
}

package() {
  cd "$srcdir/sickle-$pkgver"

  install -Dm755 sickle "$pkgdir/usr/bin/sickle"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/sickle/LICENSE"
}
