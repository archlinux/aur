# Maintainer: Brendan MacDonell <macdonellba at gmail dot com>

pkgname=python-dugong
pkgver=3.4
pkgrel=2
pkgdesc="A Python HTTP 1.1 client library designed for RESTful protocols."
arch=('any')
url="https://bitbucket.org/nikratio/python-dugong"
license=('PSF' 'Apache')
depends=('python' 'python-setuptools')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/d/dugong/dugong-$pkgver.tar.bz2)
md5sums=('20c42591c597c1059fa5d5ce713520e6')

package() {
  cd $srcdir/dugong-$pkgver
  python setup.py install --root=$pkgdir/ --optimize=1
}
