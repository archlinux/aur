pkgname=hemu-browser
pkgver=1.0
pkgrel=1
pkgdesc="A simple web browser built with PyQt5"
arch=('x86_64')
license=('MIT')
depends=('python' 'python-pyqt5' 'qt5-webengine')
source=("browser.py")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/browser.py" "$pkgdir/usr/bin/hemu-browser"
}

