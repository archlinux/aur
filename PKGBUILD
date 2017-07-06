# Maintainer: Brendan MacDonell <macdonellba at gmail dot com>

pkgname=python-dugong
pkgver=3.7.1
pkgrel=1
pkgdesc="A Python HTTP 1.1 client library designed for RESTful protocols."
arch=('any')
url="https://bitbucket.org/nikratio/python-dugong"
license=('PSF' 'Apache')
depends=('python' 'python-setuptools')
options=(!emptydirs)
source=(https://bitbucket.org/nikratio/python-dugong/get/release-$pkgver.tar.bz2)
md5sums=('84cff210d9210d183b844c365495bf77')

package() {
  cd $srcdir/nikratio-python-dugong-*  # suffix is the commit sha.
  python setup.py install --root=$pkgdir/ --optimize=1
}
