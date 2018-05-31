# $Id: PKGBUILD 243438 2017-07-09 16:57:11Z jelle $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Holger Rauch <holger dot rauch at posteo dot de>

pkgname=newt-syrup
pkgver=0.2.0
pkgrel=2
pkgdesc="Python framework for creating text-based applications"
arch=(any)
url="https://pagure.io/newt"
license=('GPL')
depends=('python2' 'libnewt')
makedepends=('python2-distribute')
options=()
source=(https://mcpierce.fedorapeople.org/sources/newt_syrup-$pkgver.tar.gz)
sha256sums=('27f34eaa54540adee5cdda95bd97d2af75a7eddcc303b4c73f36917f79e157e9')

build() {
  cd "$srcdir/newt_syrup-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/newt_syrup-$pkgver"
  python2 setup.py install --root "$pkgdir"
}
