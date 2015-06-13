# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>
pkgname=icat
pkgver=0.4
pkgrel=1
pkgdesc="outputs images in 256-color capable terminals"
arch=('i686' 'x86_64')
url="https://github.com/atextor/icat"
license=('BSD')
depends=('imlib2')
conflicts=('icat-git')
source=(https://github.com/atextor/icat/archive/v${pkgver}.tar.gz)
md5sums=('29f6901d61cc09d27cef8affb917dd85')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 icat $pkgdir/usr/bin/icat
}
