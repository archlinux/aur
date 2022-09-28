# Maintainer: thek4n

pkgname='image-crypt'
pkgver=2.0.1
pkgrel=4
pkgdesc="Steganography encryption script"
arch=('x86_64')
license=('MIT')
depends=(
  'python3'
  'python-pillow'
  'python-pyqt5'
  'python-pycryptodomex'
)
makedepends=('git' 'python-setuptools')
url='https://github.com/thek4n/ImageCrypt'
conflicts=('image-crypt')
source=("$pkgname::git+https://github.com/thek4n/ImageCrypt.git#branch=master")
sha256sums=('SKIP')

package() {
    cd "$srcdir"/"$pkgname"
    make DESTDIR="$pkgdir" PREFIX="/usr" install
}
