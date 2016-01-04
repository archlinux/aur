# Maintainer: Philipp Joram <phijor AT t-online DOT de>

pkgname=python-eyed3
pkgver=0.7.9
pkgrel=1
pkgdesc="A Python module and program for processing information about mp3 files"
arch=(any)
url="http://eyed3.nicfit.net/"
license=('GPL')
depends=('python' 'python-argparse')
makedepends=('python-setuptools')
source=(http://eyed3.nicfit.net/releases/eyeD3-$pkgver.tar.gz)
options=(!emptydirs)

md5sums=('7fdf97f971033207355b5d550414ea75')

build() {
  cd $srcdir/eyeD3-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/eyeD3-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}
