# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_realname=mattermostdriver
pkgname="python-$_realname"
pkgver=2.1.1
pkgrel=1
pkgdesc="TODO"
arch=('any')
url="https://pypi.python.org/pypi/mattermostdriver/"
license=('TODO')
depends=('python')
source=("https://pypi.python.org/packages/7b/bb/7ff0a83b3e83943439dea42c914917accb81b44696bf31f793db79d31498/$_realname-$pkgver.tar.gz")
md5sums=('914d1008cd7cd7f982d622b0caacba33')

package() {
  cd "$srcdir/$_realname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
