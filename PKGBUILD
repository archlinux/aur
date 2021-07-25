# Maintainer: Francois Boulogne <fboulogne at april dot org>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_realname=freesms
pkgname=python-freesms
pkgver=0.2.0
pkgrel=1
pkgdesc="Python interface to Free mobile SMS API."
arch=('any')
url="https://pypi.python.org/pypi/freesms"
license=('MIT')
depends=('python' 'python-sigtools' 'python-six')
makedepends=('python-setuptools')
source=("https://github.com/bfontaine/freesms/archive/$pkgver.tar.gz")
md5sums=('7222b3a39c2b6e141d391230d818e52b')

package() {
  cd "$srcdir/$_realname-$pkgver"
  python setup.py install --root="${pkgdir}"  --optimize=1
}

# vim:ts=2:sw=2:et:
