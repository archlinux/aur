# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=plow-bin
pkgver=1.3.2
pkgrel=1
pkgdesc="A high-performance HTTP benchmarking tool that includes a real-time web UI and terminal display.(Prebuilt version)"
arch=(
	'aarch64'
	'x86_64'
)
url="https://github.com/six-ddc/plow"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.rpm")
sha256sums_aarch64=('b9e3a6bcc02ba190487db1eb565c5c7c224a67ec9ef5be15dd573cb63f8d16d6')
sha256sums_x86_64=('2bb4c602c66e57bd434bbbf7203701c0b801fc2b6d2368befa928a22f0af6f20')
package() {
	install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
}