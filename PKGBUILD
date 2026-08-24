# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: IIpho3nix <iipho3nix at gmail dot com>
pkgname=goshs-bin
pkgver=2.1.6
pkgrel=1
pkgdesc="A SimpleHTTPServer written in Go, enhanced with features and with a nice design.(Prebuilt version)"
arch=(
	'aarch64'
	'armv7h'
	'i686'
	'x86_64'
)
url="https://goshs.de/"
_ghurl="https://github.com/goshs-labs/goshs"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/goshs-labs/goshs/v${pkgver}/LICENSE")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.rpm")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_armv7.rpm")
source_i686=("${pkgname%-bin}-${pkgver}-i686.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_386.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.rpm")
sha256sums=('791aa7d1cac7e097ad6e792e974688f433018e11bbe387e62330319dda68c94a')
sha256sums_aarch64=('995ec872860e31d67a92c4fbc585b32d2b183376d2d81418b0e9ef794998af11')
sha256sums_armv7h=('a8522bbada0e51cb1ce55e56501fc8515eb1a994bfae7fb20c542c6ff7bc66e5')
sha256sums_i686=('638883da3f19e2387685f8bfd5dffd2d33564a229591e2c7133e5168bb82a3a2')
sha256sums_x86_64=('61106fe392693d44a31571a9335445cf6888674351ef32b9d6a1e672dd237228')
package() {
	install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
