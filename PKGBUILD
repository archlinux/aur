# Maintainer: lxsh-S <kumarlakshya973@gmail.com>
pkgname='gos-bin'
pkgver=0.6.5
pkgrel=1
pkgdesc="A simple CLI tool that can be used to make project structures!"
arch=('x86_64')
url="https://github.com/lxsh-S/gos"
license=('MIT')
depends=()
makedepends=()
provides=('gos')
conflicts=('gos')

source=("https://github.com/lxsh-S/gos/releases/download/v${pkgver}/gos-linux-amd64")
sha256sums=('79a297a10b79b160fb795727a50a28a8b28d1fdecd876d01b18fd4fd21cecd15')

package() {
  install -Dm755 "$srcdir/gos-linux-amd64" "$pkgdir/usr/bin/gos"
}
