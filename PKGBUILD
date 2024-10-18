# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: IIpho3nix <iipho3nix at gmail dot com>
pkgname=goshs-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="A SimpleHTTPServer written in Go, enhanced with features and with a nice design.Prebuilt version."
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
sha256sums_aarch64=('81df6229956953ddbd28c0eb160da65e233fc95334018eceb5855d9bd3023a05')
sha256sums_armv7h=('81df6229956953ddbd28c0eb160da65e233fc95334018eceb5855d9bd3023a05')
sha256sums_i686=('5341c00476335c5dda92daddffa93113c0c26023f913ace436abca2b9633dd8b')
sha256sums_x86_64=('43afc2ff8a0ea6e078a65475dcfb87e873155a4d6cdf3c63f8b7e5bdd72164ba')
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}