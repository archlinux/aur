# Maintainer: madyel
pkgname=madypass
pkgver=1.1
pkgrel=1
pkgdesc="Secure password manager with a PyQt5 graphical interface and Fernet encryption"
arch=('any')
url="https://github.com/madyel/madypass-aur"
license=('GPL-3.0-only')
depends=('python' 'python-pyqt5' 'python-cryptography')

source=("$pkgname-$pkgver.tar.gz::https://github.com/madyel/madypass-aur/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/madypass-aur-$pkgver/madypass.py" "$pkgdir/usr/bin/madypass"

    install -Dm644 "$srcdir/madypass-aur-$pkgver/madypass.desktop" \
        "$pkgdir/usr/share/applications/madypass.desktop"

    install -Dm644 "$srcdir/madypass-aur-$pkgver/icon.png" \
        "$pkgdir/usr/share/pixmaps/madypass.png"
}