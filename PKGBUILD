# Maintainer: Martin Minka <martin dot minka at gmail dot com>

pkgname=hl-log-viewer-bin
pkgver='v0.30.0'
pkgrel=1
pkgdesc='Log viewer which translates JSON logs into pretty human-readable representation'
url='https://github.com/pamburus/hl'
conflicts=('hl-log-viewer')
depends=()
makedepends=()
arch=('x86_64' 'aarch64')
license=('MIT')

source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/pamburus/hl/releases/download/${pkgver//_/-}/hl-linux-x86_64-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/pamburus/hl/releases/download/${pkgver//_/-}/hl-linux-arm64-gnu.tar.gz")
sha512sums_x86_64=('e6b0fc081869d6affc6faf4a30e5d9b2630567722255cf93a9dd610d4ddfa59c044ee2fbe5992d13670519d70717096180e71bc8caa765604b032e80dd517c61')
sha512sums_aarch64=('f62123f3e91417f21046122625923b26ba01796b427e67745fe90fc9cfbe13156db606c5bbf75db50de1ed4a6f4b36ff1a721b84609da358d737d49e94de185c')

package() {
  install -Dm0755 "hl" "$pkgdir/usr/bin/hl"
}
