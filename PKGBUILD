# Maintainer: Philipp Joram <phijor AT t-online DOT de>

pkgname=python-eyed3
pkgver=0.7.8
pkgrel=1
pkgdesc="A Python module and program for processing information about mp3 files"
arch=(any)
url="http://eyed3.nicfit.net/"
license=('GPL')
depends=('python' 'python-argparse')
makedepends=('python-setuptools')
source=(http://eyed3.nicfit.net/releases/eyeD3-$pkgver.tar.gz)
options=(!emptydirs)

md5sums=('2783538edb56d7f583b7c8a5801b51dc')

build() {
  cd $srcdir/eyeD3-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/eyeD3-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}
