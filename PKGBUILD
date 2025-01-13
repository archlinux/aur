# Maintainer: qxb3 <qxbthree@gmail.com>
# Package: fum
# Description: A tui-based mpris music client.
# Version: 0.3.2
# License: MIT
# URL: https://github.com/qxb3/fum

pkgname=fum
pkgver=0.3.2
pkgrel=1
pkgdesc="A tui-based mpris music client."
arch=('x86_64')
url="https://github.com/qxb3/fum"
license=('MIT')
depends=('glib2' 'dbus' 'ncurses' 'libpng' 'openssl' 'zlib')
source=("https://github.com/qxb3/fum/releases/download/v$pkgver/fum-x86-64_v$pkgver")
sha256sums=('SKIP')

package() {
  install -Dm755 "$srcdir/fum-x86-64_v$pkgver" "$pkgdir/usr/bin/fum"
}
