# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=mcfly-bin
pkgver=0.5.11
pkgrel=1
pkgdesc="Fly through your shell history"
arch=('i686' 'x86_64' 'arm' 'armv7h')
url="https://github.com/cantino/mcfly"
license=('MIT')
provides=('mcfly')
conflicts=('mcfly')
source=("https://raw.githubusercontent.com/cantino/mcfly/master/LICENSE")
source_i686=("https://github.com/cantino/mcfly/releases/download/v$pkgver/mcfly-v$pkgver-i686-unknown-linux-musl.tar.gz")
source_x86_64=("https://github.com/cantino/mcfly/releases/download/v$pkgver/mcfly-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
source_arm=("https://github.com/cantino/mcfly/releases/download/v$pkgver/mcfly-v$pkgver-arm-unknown-linux-gnueabi.tar.gz")
source_armv7h=("https://github.com/cantino/mcfly/releases/download/v$pkgver/mcfly-v$pkgver-armv7-unknown-linux-gnueabihf.tar.gz")
sha256sums=('SKIP')
sha256sums_i686=('0e7e8136c6b821f87c1ca000f142131f1a0ab0c44c70d008656a086735331edc')
sha256sums_x86_64=('ac89378c1dfc547d8632066806591307ac7f94d2e63be9cfa6e8645a6f934525')
sha256sums_arm=('f528b71a3bfb124b377d38722d3e677803d5e290c5b8c25b57468f73b90582c9')
sha256sums_armv7h=('fabe486b8e72ef00b7d34d23a745199185250ce6790cb4c7521f7d44b392d5cc')


package() {
  install -Dm755 "$srcdir/mcfly" -t "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/mcfly"
}
