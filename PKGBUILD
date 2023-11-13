# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: IIpho3nix <iipho3nix at gmail dot com>
pkgname=goshs-bin
pkgver=0.3.6
pkgrel=2
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
sha256sums_aarch64=('dc0e86324dc64a364dc81dd2313c9338354549871127adccef327c47778dfaf9')
sha256sums_armv7h=('dc0e86324dc64a364dc81dd2313c9338354549871127adccef327c47778dfaf9')
sha256sums_i686=('67fdf382a16f8f99514f5ab2300ca6355f9dc9e0754c43f37b89b5c4ca15fc03')
sha256sums_x86_64=('a7b25c8a45ea7a78bb2c77f9d865ec2a7ccb6783506d3ca31abe5d8e78b5b3a0')
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}