# Maintainer: Francois Boulogne <fboulogne at april dot org>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_realname=freesms
pkgname=python-freesms
pkgver=0.1.2
pkgrel=1
pkgdesc="Python interface to Free mobile SMS API."
arch=('any')
url="https://pypi.python.org/pypi/freesms"
license=('MIT')
depends=('python' 'python-sigtools' 'python-six')
makedepends=('python-setuptools')
source=("https://github.com/bfontaine/freesms/archive/$pkgver.tar.gz")
md5sums=('ed3a58b728eec2bc5b994a552886a105')

package() {
  cd "$srcdir/$_realname-$pkgver"
  python setup.py install --root="${pkgdir}"  --optimize=1
}

# vim:ts=2:sw=2:et:
