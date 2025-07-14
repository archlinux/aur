# Maintainer: Your Name <you@example.com>
pkgname=hashbox
pkgver=1.0
pkgrel=3
pkgdesc="A GUI tool for hashing and verifying passwords using PyQt5"
arch=('any')
url="https://github.com/madyel/password-hasher"
license=('MIT')
depends=('python' 'python-pyqt5' 'python-bcrypt' 'python-argon2-cffi')
source=("hashbox.py"
        "hashbox.desktop"
        "icon.png")
md5sums=('SKIP' 'SKIP' 'SKIP')

package() {
  install -Dm755 "$srcdir/hashbox.py" "$pkgdir/usr/bin/hashbox"
  install -Dm644 "$srcdir/hashbox.desktop" "$pkgdir/usr/share/applications/hashbox.desktop"
  install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/pixmaps/hashbox.png"
}
