
pkgname=python-art
pkgver=6.0
pkgrel=1
pkgdesc="ASCII art library for Python "
arch=('any')
url="https://github.com/sepandhaghighi/art/"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
prodides=("python-art")
source=("https://github.com/sepandhaghighi/art/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

check() {
  cd $srcdir/art-$pkgver 
  python3 setup.py check
}

package() {
  cd $srcdir/art-$pkgver 
  python setup.py install --root="$pkgdir/" --optimize=1
}
