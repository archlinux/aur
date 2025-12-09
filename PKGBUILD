# Maintainer: Esprss <l3nuksoid@gmail.com>
pkgname=poloniumclicker
pkgver=1.0
pkgrel=1
pkgdesc="Matrix-style falling characters in Python with PyQt5 GUI"
arch=('any')
url="https://github.com/yourusername/poloniumclicker"
license=('MIT')
depends=('python' 'python-pyqt5' 'python-pynput')
source=("poloniumclicker.py")
sha256sums=('SKIP')  # используем SKIP, потому что это локальный файл

package() {
    install -Dm755 "$srcdir/poloniumclicker.py" "$pkgdir/usr/bin/poloniumclicker"
}
