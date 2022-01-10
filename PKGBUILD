# Maintainer: angelsl <angelsl at in04 dot sg>

pkgname=fluminurs-bin
pkgver=1.4.0
pkgrel=1
pkgdesc='Sync tool for LumiNUS'
depends=('gcc-libs' 'openssl')
arch=('x86_64')
url='https://github.com/fluminurs/fluminurs'
license=('MIT')
source=("https://github.com/fluminurs/fluminurs/releases/download/$pkgver/fluminurs-cli.ubuntu" 'https://raw.githubusercontent.com/fluminurs/fluminurs/master/LICENSE')
sha256sums=('e95d063ec13eb682abaf6db5333572d0afa9e60823fb128e83bfc517eab709a9' 'SKIP')

package() {
  install -D -m755 fluminurs-cli.ubuntu "$pkgdir/usr/bin/fluminurs"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/fluminurs/LICENSE"
}
