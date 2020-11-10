# Maintainer: Dylan Delgado <dylan1496 at live dot com>
# Contributor: Francois Boulogne <fboulogne at april dot org>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_realname=clize
pkgname=python-clize
pkgver=4.1.1
pkgrel=1
pkgdesc="This decorator will turn your normal python functions into proper shell commands"
arch=('any')
url="https://pypi.python.org/pypi/clize/"
license=('MIT')
depends=('python' 'python-sigtools' 'python-six')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/a4/70/909c0b03ae75c26d5aa5f511cf10de53fe4343999ecde82f03316906d72a/$_realname-$pkgver.tar.gz")
md5sums=('64a33144750f294a8ef7bbcf20fb6a82')

package() {
  cd "$srcdir/$_realname-$pkgver"
  python setup.py install --root="${pkgdir}"  --optimize=1
}

# vim:ts=2:sw=2:et:
