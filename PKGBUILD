# Maintainer: Jeff M Hubbard <jeffmhubbard@gmail.com>
# Contributor: Philippe Proulx <eeppeliteloop@gmail.com>
pkgname=python-colormath
pkgver=3.0.0
pkgrel=2
pkgdesc="Python module that abstracts common color math operations"
arch=('any')
url="https://github.com/gtaylor/python-colormath"
license=('GPL3')
depends=('python' 'python-networkx' 'python-numpy')
makedepends=('python-setuptools')
provides=('python-colormath')
conflicts=('python-colormath')
source=('https://github.com/gtaylor/python-colormath/archive/3.0.0.tar.gz')
md5sums=('7a6fe120a4a688fb87b23f9930508471')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
