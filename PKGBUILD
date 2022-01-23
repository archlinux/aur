# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=pomerium-cli-bin
pkgver=0.16.0
pkgrel=2
pkgdesc='CLI component for Pomerium'
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/pomerium/cli"
license=('Apache')
provides=('pomerium-cli')
conflicts=('pomerium-cli')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::$url/releases/download/v${pkgver}/pomerium-cli-linux-amd64.tar.gz")
source_armv6h=("${pkgname}-${pkgver}-armv6h.tar.gz::$url/releases/download/v${pkgver}/pomerium-cli-linux-armv6.tar.gz")
source_armv7h=("${pkgname}-${pkgver}-armv7h.tar.gz::$url/releases/download/v${pkgver}/pomerium-cli-linux-armv7.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::$url/releases/download/v${pkgver}/pomerium-cli-linux-arm64.tar.gz")
sha256sums_x86_64=('648c2d96333224aa08f5019056f205bf138dd5705fb1049357f43f4e4b4adcf4')
sha256sums_armv6h=('7e4d739bfa8ed723ca9aa71ae5c4beabef7ca90b576b2984191dd2a430a0b266')
sha256sums_armv7h=('db9b5214f2adc9742764329ff580fe0ae05620c8e7e33e30bee0b8130f1550ed')
sha256sums_aarch64=('6cc9bd42f376d9d721b09357d4bceca0852fbda3acd13e826fdf40aed4713f91')

package() {
	install -D pomerium-cli -t "${pkgdir}/usr/bin"
}
