# Maintainer: angelsl <angelsl at in04 dot sg>

pkgname=fluminurs-bin
pkgver=1.3.1
pkgrel=1
pkgdesc='Sync tool for LumiNUS'
depends=('gcc-libs' 'openssl')
arch=('x86_64')
url='https://github.com/fluminurs/fluminurs'
license=('MIT')
source=("https://github.com/fluminurs/fluminurs/releases/download/$pkgver/fluminurs-cli.ubuntu" 'https://raw.githubusercontent.com/fluminurs/fluminurs/master/LICENSE')
sha256sums=('f480e115a724de79c0eb9e9be0ec597fdb6055f557f8491cfd636a67f5d695ae' 'SKIP')

package() {
  install -D -m755 fluminurs-cli.ubuntu "$pkgdir/usr/bin/fluminurs"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/fluminurs/LICENSE"
}
