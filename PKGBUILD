# Maintainer: Dylan Delgado <dylan1496 at live dot com>
# Contributor: Francois Boulogne <fboulogne at april dot org>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_realname=clize
pkgname=python-clize
pkgver=4.2.1
pkgrel=1
pkgdesc="This decorator will turn your normal python functions into proper shell commands"
arch=('any')
url="https://pypi.python.org/pypi/clize/"
license=('MIT')
depends=('python' 'python-sigtools' 'python-six')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/a4/be/a36c49d7d92d60de4a011ca0e5bdca9b3ecaf825337ff2e09244776ab0db/$_realname-$pkgver.tar.gz")
md5sums=('b61f1f9d08841010ed15a62ddb215ccb')

package() {
  cd "$srcdir/$_realname-$pkgver"
  python setup.py install --root="${pkgdir}"  --optimize=1
}

# vim:ts=2:sw=2:et:
