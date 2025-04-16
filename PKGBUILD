# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: IIpho3nix <iipho3nix at gmail dot com>
pkgname=goshs-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="A SimpleHTTPServer written in Go, enhanced with features and with a nice design.(Prebuilt version)"
arch=(
	'aarch64'
	'armv7h'
	'i686'
	'x86_64'
)
url="https://hesec.de/tags/goshs/"
_ghurl="https://github.com/patrickhener/goshs"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_linux_arm64.tar.gz")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_linux_arm64.tar.gz")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_linux_386.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_linux_x86_64.tar.gz")
sha256sums_aarch64=('1fed8dd3ef3a92f0ebba1728dfa5ab7ec690873117c78ab57b511f4f7c55d7b2')
sha256sums_armv7h=('1fed8dd3ef3a92f0ebba1728dfa5ab7ec690873117c78ab57b511f4f7c55d7b2')
sha256sums_i686=('18f767d72e8eac0b596cc104b7cda72b4b1ef2773f9686f9f7a08df01ebabd2d')
sha256sums_x86_64=('aadb8c83b5bb4107f37d2caa64d961dbad9a20c60950fae10261c5ff2ce23e78')
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
