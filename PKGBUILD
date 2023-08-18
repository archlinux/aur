# Maintainer: Dylan Delgado <dylan1496 at live dot com>
# Contributor: Francois Boulogne <fboulogne at april dot org>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_realname=clize
pkgname=python-clize
pkgver=5.0.2
pkgrel=1
pkgdesc="This decorator will turn your normal python functions into proper shell commands"
arch=('any')
url="https://pypi.python.org/pypi/clize/"
license=('MIT')
depends=('python' 'python-sigtools' 'python-six')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/27/d9/351db7247739f7cdaa076a1a25163afc7b553af556273729320a64cf0ab4/clize-5.0.2.tar.gz")
md5sums=('bd3c5b678827b41458d972bb7181b8fa')

package() {
  cd "$srcdir/$_realname-$pkgver"
  python setup.py install --root="${pkgdir}"  --optimize=1
}

# vim:ts=2:sw=2:et:
