# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: IIpho3nix <iipho3nix at gmail dot com>
pkgname=goshs-bin
pkgver=1.0.7
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
sha256sums_aarch64=('37a46b7b19d8f498ec828297ac7bb2400fdb8012b665013fe6c6f853624a1e67')
sha256sums_armv7h=('37a46b7b19d8f498ec828297ac7bb2400fdb8012b665013fe6c6f853624a1e67')
sha256sums_i686=('6cd7444d8c6e2a77a9573197e7f68c4eda6c30ca2aafcd77b334d546d695e096')
sha256sums_x86_64=('eeb923833ae628247cabe89633c00e2f2ecceb1b2d1bbf9950ea8baf37c34b26')
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
