# Maintainer: Philippe Proulx <eeppeliteloop@gmail.com>
pkgname=python-colormath
pkgver=2.1.1
pkgrel=1
pkgdesc="Python module that abstracts common color math operations"
arch=('any')
url="https://github.com/gtaylor/python-colormath"
license=('GPL3')
depends=('python' 'python-networkx' 'python-numpy')
makedepends=('python-setuptools')
provides=('python-colormath')
conflicts=('python-colormath')
source=('https://github.com/gtaylor/python-colormath/archive/2.1.1.tar.gz')
md5sums=('77b1b2e053f318069afe6c524ba2d7e8')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
