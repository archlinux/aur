# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=mcfly-bin
pkgver=0.5.10
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
sha256sums_i686=('6f922b644570eb8d5a6b51f60cf60829cf4ad55faa85ae02029087cfe75d9a8c')
sha256sums_x86_64=('1bec061f6974ceed9e4d67129c65b4d64249dcb30751aa793551ab2a879c0d07')
sha256sums_arm=('ffe33d81b988e0226390d1379c49539b09c3388e5c2bc7845b430313a4ea7fda')
sha256sums_armv7h=('e71615905ae5da82affd728515fde310de4b51e5de30611758063e897c7c6ea3')


package() {
  install -Dm755 "$srcdir/mcfly" -t "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/mcfly"
}
