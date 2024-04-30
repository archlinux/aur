# Maintainer: Alex Ganin <alex at ganin dot tech>
pkgname=bitrix24-linux
pkgver=14.4.0.75
pkgrel=1
pkgdesc="Bitrix24 linux desktop"
arch=("x86_64")
url="https://www.bitrix24.com/applications.php"
source=("https://dl.bitrix24.com/b24/bitrix24_desktop.rpm")

sha256sums=("5db562408b4817f78da67c14faadbd970cc16ca131b58037732a8a893fb8ea9d")

package() {
  find $srcdir/ -mindepth 1 -maxdepth 1 -type d | xargs cp -r -t "$pkgdir"
}
