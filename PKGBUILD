# Maintainer: Madyel
pkgname=hashbox
pkgver=1.1
pkgrel=1
pkgdesc="A GUI tool for hashing and verifying passwords using PyQt5"
arch=('any')
url="https://github.com/madyel/hashbox-aur"
license=('MIT')
depends=('python' 'python-pyqt5' 'python-bcrypt' 'python-argon2-cffi')

source=("$pkgname-$pkgver.tar.gz::https://github.com/madyel/hashbox-aur/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  install -Dm755 "$srcdir/hashbox-aur-$pkgver/hashbox.py" "$pkgdir/usr/bin/hashbox"
  install -Dm644 "$srcdir/hashbox-aur-$pkgver/hashbox.desktop" "$pkgdir/usr/share/applications/hashbox.desktop"
  install -Dm644 "$srcdir/hashbox-aur-$pkgver/icon.png" "$pkgdir/usr/share/pixmaps/hashbox.png"
}