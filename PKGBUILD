# Maintainer: McNoggins <gagnon88 (at) Gmail (dot) com>
pkgname="python-imread"
pkgver=0.5.1
pkgrel=1
pkgdesc="Read images to numpy arrays"
arch=('any')
url="https://pypi.python.org/pypi/imread/"
license=('MIT')
depends=('python' 'libpng' 'libtiff' 'libwebp' 'python-numpy')
makedepends=('python-setuptools')
provides=('python-imread')
source=("https://pypi.python.org/packages/source/i/imread/imread-$pkgver.tar.gz")
sha256sums=('c72d05d6099e17c45ec00b6629f432e70de7e555daa48de84e94199c22ff2ec7')

package() {
  cd "$srcdir/imread-$pkgver"
  
  # Setup package
  python setup.py install --root="$pkgdir"
}
