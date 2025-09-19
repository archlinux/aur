# Maintainer: Your Name <you@example.com>
pkgname=pixascii
pkgver=0.1.3
pkgrel=1
pkgdesc="Convert images to ASCII art"
arch=('any')
url="https://pypi.org/project/pixascii/"
license=('MIT')
depends=('python' 'python-pillow')
makedepends=('python-pip' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/pixascii/pixascii-${pkgver}.tar.gz")
sha256sums=('SKIP') # replace with real sha256 if desired

package() {
  cd "$srcdir/pixascii-$pkgver"
  python -m pip install --root="$pkgdir" --no-deps --prefix=/usr .
}
