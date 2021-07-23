# Maintainer: angelsl <angelsl at in04 dot sg>

pkgname=fluminurs-bin
pkgver=1.3.0
pkgrel=1
pkgdesc='Sync tool for LumiNUS'
depends=('gcc-libs' 'openssl')
arch=('x86_64')
url='https://github.com/fluminurs/fluminurs'
license=('MIT')
source=("https://github.com/fluminurs/fluminurs/releases/download/$pkgver/fluminurs-cli.ubuntu" 'https://raw.githubusercontent.com/fluminurs/fluminurs/master/LICENSE')
sha256sums=('3ed9ff5d9b3a6bbe49cec3cae4ceafd659d51a4af39b880181d9f964402618af' 'SKIP')

package() {
  install -D -m755 fluminurs-cli.ubuntu "$pkgdir/usr/bin/fluminurs"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/fluminurs/LICENSE"
}
