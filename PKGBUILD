# Maintainer: Dylan Delgado <dylan1496 at live dot com>
# Contributor: Francois Boulogne <fboulogne at april dot org>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_realname=clize
pkgname=python-clize
pkgver=5.0.0
pkgrel=1
pkgdesc="This decorator will turn your normal python functions into proper shell commands"
arch=('any')
url="https://pypi.python.org/pypi/clize/"
license=('MIT')
depends=('python' 'python-sigtools' 'python-six')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/31/6f/c0cbf1da986bfe562d205c7f7cabe5b8aaf856621d9fc3adcd3e675f0b7f/$_realname-$pkgver.tar.gz")
md5sums=('e8a0ef7035caec66f98d1800de2fcffc')

package() {
  cd "$srcdir/$_realname-$pkgver"
  python setup.py install --root="${pkgdir}"  --optimize=1
}

# vim:ts=2:sw=2:et:
