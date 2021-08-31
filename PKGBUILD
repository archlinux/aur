# Maintainer: Dylan Delgado <dylan1496 at live dot com>
# Contributor: Francois Boulogne <fboulogne at april dot org>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_realname=clize
pkgname=python-clize
pkgver=4.2.0
pkgrel=1
pkgdesc="This decorator will turn your normal python functions into proper shell commands"
arch=('any')
url="https://pypi.python.org/pypi/clize/"
license=('MIT')
depends=('python' 'python-sigtools' 'python-six')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/6e/c7/82a14fef31f555db30d53dc52f17cfcf1707d6355ab49132b30671daebd6/$_realname-$pkgver.tar.gz")
md5sums=('7b74dd19b8f4dd0c90220835955ce729')

package() {
  cd "$srcdir/$_realname-$pkgver"
  python setup.py install --root="${pkgdir}"  --optimize=1
}

# vim:ts=2:sw=2:et:
