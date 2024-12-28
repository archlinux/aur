# Maintainer: qxb3 <qxbthree@gmail.com>
# Package: fum
# Description: A tui-based mpris music client.
# Version: 0.1.3
# License: MIT
# URL: https://github.com/qxb3/fum

pkgname=fum
pkgver=0.1.3
pkgrel=2
pkgdesc="A tui-based mpris music client."
arch=('x86_64')
url="https://github.com/qxb3/fum"
license=('MIT')
depends=('rust' 'cargo' 'glib2')
makedepends=('rust' 'cargo' 'git')
source=("https://github.com/qxb3/fum/releases/download/v$pkgver/fum-x86-64_v$pkgver")
sha256sums=('SKIP')

package() {
  install -Dm755 "$srcdir/fum-x86-64_v$pkgver" "$pkgdir/usr/bin/fum"
}
