# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: IIpho3nix <iipho3nix at gmail dot com>
pkgname=goshs-bin
pkgver=2.0.3
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
sha256sums_aarch64=('2db85d7749e9d92e63d1bd74ca043262003cc6a68c1d8b7a1c741ed97eb9c7f7')
sha256sums_armv7h=('2db85d7749e9d92e63d1bd74ca043262003cc6a68c1d8b7a1c741ed97eb9c7f7')
sha256sums_i686=('7ad4d2bb9ce1cce181b05fd738e67895d7cd7f1f36eb922114c67c2b40d5cbd8')
sha256sums_x86_64=('a8f26e18c5a8e13d0e6b16a0741ff38a2eb8a83f3830250189ead06bdf1fc89d')
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
