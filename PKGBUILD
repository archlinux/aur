pkgname=madypass
pkgver=1.0
pkgrel=3
pkgdesc="Gestore di password sicure con GUI PyQt5 e cifratura Fernet"
arch=('any')
url="https://github.com/madyel/generate-password"
license=('GPL3')
depends=('python-pyqt5' 'python-cryptography')
source=("madypass.py" "icon.png" "madypass.desktop")
md5sums=('SKIP' 'SKIP' 'SKIP')

package() {
    install -Dm755 "$srcdir/madypass.py" "$pkgdir/usr/bin/madypass"
    install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/pixmaps/madypass.png"
    install -Dm644 "$srcdir/madypass.desktop" "$pkgdir/usr/share/applications/madypass.desktop"
}