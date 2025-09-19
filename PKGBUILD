# Maintainer: Henri <you@example.com>
pkgname=pixascii
pkgver=0.1.3
pkgrel=1
pkgdesc="Convert images into ASCII art in the terminal"
arch=('any')
url="https://pypi.org/project/pixascii/"
license=('MIT')
depends=('python' 'python-pillow')
source=("https://files.pythonhosted.org/packages/source/p/pixascii/pixascii-0.1.3.tar.gz")
sha256sums=('SKIP') # optional, compute sha256sum later

package() {
  python -m pip install --prefix="$pkgdir/usr" --root="$pkgdir" "${srcdir}/pixascii-0.1.3.tar.gz"
}
