# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: IIpho3nix <iipho3nix at gmail dot com>
pkgname=goshs-bin
pkgver=0.3.8
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
sha256sums_aarch64=('3b0903806759a60369ff12d316470dcfb1b4aa86ebdadf6232397ab1941bbf9d')
sha256sums_armv7h=('3b0903806759a60369ff12d316470dcfb1b4aa86ebdadf6232397ab1941bbf9d')
sha256sums_i686=('6248896ec9b50a39b7a61e31274ed9362301341051ea6aa3ed78da20e470a5b0')
sha256sums_x86_64=('f9d27ab2f980550cc4369b75ecac15b7441b7cde1bd0dc9c33b14e73ec2f815a')
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}