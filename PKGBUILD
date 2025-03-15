# Maintainer: qxb3 <qxbthree@gmail.com>
# Package: fum-bin
# Description: A fully ricable tui-based music client.
# Version: 1.3.1
# License: MIT
# URL: https://github.com/qxb3/fum

pkgname=fum-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="A fully ricable tui-based mpris music client."
arch=('x86_64')
url="https://github.com/qxb3/fum"
license=('MIT')
depends=('glib2' 'dbus' 'ncurses' 'libpng' 'openssl' 'zlib')
source=("https://github.com/qxb3/fum/releases/download/v$pkgver/fum-x86-64_v$pkgver")
sha256sums=('SKIP')

package() {
  install -Dm755 "$srcdir/fum-x86-64_v$pkgver" "$pkgdir/usr/bin/fum"
}
