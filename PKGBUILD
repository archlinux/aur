# Maintainer: Francois Boulogne <fboulogne at april dot org>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_realname=freesms
pkgname=python-freesms
pkgver=0.1.1
pkgrel=1
pkgdesc="Python interface to Free mobile SMS API."
arch=('any')
url="https://pypi.python.org/pypi/freesms"
license=('MIT')
depends=('python' 'python-sigtools' 'python-six')
makedepends=('python-setuptools')
source=("https://github.com/bfontaine/freesms/archive/$pkgver.tar.gz")
md5sums=('3f339c1722825867aa28e43094d1da59')

package() {
  cd "$srcdir/$_realname-$pkgver"
  python setup.py install --root="${pkgdir}"  --optimize=1
}

# vim:ts=2:sw=2:et:
