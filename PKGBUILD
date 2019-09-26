# Maintainer: Kazuki Sawada <kazuki@6715.jp>
# Contributor: Brendan MacDonell <macdonellba at gmail dot com>

pkgname=python-dugong
pkgver=3.7.5
pkgrel=1
pkgdesc="A Python HTTP 1.1 client library designed for RESTful protocols."
arch=('any')
url="https://github.com/python-dugong/python-dugong"
license=('PSF' 'Apache')
depends=('python' 'python-setuptools')
options=(!emptydirs)
source=(https://github.com/python-dugong/python-dugong/archive/release-$pkgver.tar.gz)
md5sums=('973c8af853e5bf5b087335341c887fe7')

package() {
  cd $srcdir/python-dugong-release-$pkgver
  python setup.py install --root=$pkgdir/ --optimize=1
}
