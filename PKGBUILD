pkgname=swaytools
pkgver=0.1.1
pkgrel=1
pkgdesc='Quality of life tools for sway'
arch=('any')
url="https://github.com/tmccombs/swaytools"
license=('GPL3')
depends=('python' 'sway')
makedepends=('python-setuptools')
optdepends=('slurp: for swayinfo' 'bemenu: for winfocus' 'dmenu: for winfocus')
source=("https://github.com/tmccombs/swaytools/archive/$pkgver.tar.gz")

b2sums=('520e4c897b58e868de800b57541127e7671e233d8c4fcd49c82bbe584b5f568ddddadc608b87e6b93fe5edebbe3ac1d311b156c873e173e681ca949eb2fd1be6')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
