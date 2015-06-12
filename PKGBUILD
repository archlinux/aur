# Maintainer: McNoggins <gagnon88 (at) Gmail (dot) com>
pkgname="python2-imread"
pkgver=0.5.1
pkgrel=1
pkgdesc="Read images to numpy arrays"
arch=('any')
url="https://pypi.python.org/pypi/imread/"
license=('MIT')
depends=('python2' 'libpng' 'libtiff' 'libwebp' 'python2-numpy') 
makedepends=('python2-setuptools')
provides=('python2-imread')
source=("https://pypi.python.org/packages/source/i/imread/imread-$pkgver.tar.gz")
sha256sums=('c72d05d6099e17c45ec00b6629f432e70de7e555daa48de84e94199c22ff2ec7')

package() {
  cd "$srcdir/imread-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
