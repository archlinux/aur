# Maintainer: angelsl <angelsl at in04 dot sg>

pkgname=fluminurs-bin
pkgver=1.2.0
pkgrel=1
pkgdesc='Sync tool for LumiNUS'
depends=('gcc-libs' 'openssl')
arch=('x86_64')
url='https://github.com/fluminurs/fluminurs'
license=('MIT')
source=("https://github.com/fluminurs/fluminurs/releases/download/$pkgver/fluminurs.ubuntu" 'https://raw.githubusercontent.com/fluminurs/fluminurs/master/LICENSE')
sha256sums=('6bdea87a37b7963f6e26895242bdc6a1e1f1e9da71bca8006df76dc6bf760b18' 'SKIP')

package() {
  install -D -m755 fluminurs.ubuntu "$pkgdir/usr/bin/fluminurs"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/fluminurs/LICENSE"
}
