# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: IIpho3nix <iipho3nix at gmail dot com>
pkgname=goshs-bin
pkgver=0.3.7
pkgrel=1
pkgdesc="A SimpleHTTPServer written in Go, enhanced with features and with a nice design"
arch=(
	"aarch64"
	"armv7h"
	"i686"
	"x86_64"
)
url="https://hesec.de/tags/goshs/"
_ghurl="https://github.com/patrickhener/goshs"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_linux_arm64.tar.gz")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_linux_arm64.tar.gz")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_linux_386.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_linux_x86_64.tar.gz")
sha256sums_aarch64=('bb6997d23975db8ef836442f315650fd03b02cc2e664c602c0b5aa666542d8a9')
sha256sums_armv7h=('bb6997d23975db8ef836442f315650fd03b02cc2e664c602c0b5aa666542d8a9')
sha256sums_i686=('2122d1fc36dcce82490b6f3bf3745505b1bc80308e3428fbd11adacede7c6a9c')
sha256sums_x86_64=('42f3e5a4a16ae5fefbc135d8b4c10db988f98250729d0d25509e4530c4ca6adc')
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}