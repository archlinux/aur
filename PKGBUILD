# Maintainer: Brendan MacDonell <macdonellba at gmail dot com>

pkgname=python-dugong
pkgver=3.5
pkgrel=1
pkgdesc="A Python HTTP 1.1 client library designed for RESTful protocols."
arch=('any')
url="https://bitbucket.org/nikratio/python-dugong"
license=('PSF' 'Apache')
depends=('python' 'python-setuptools')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/d/dugong/dugong-$pkgver.tar.bz2)
md5sums=('996ea576a8bc15551b31e1e7b8ddf945')

package() {
  cd $srcdir/dugong-$pkgver
  python setup.py install --root=$pkgdir/ --optimize=1
}
