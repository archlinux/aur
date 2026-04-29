# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=plow-bin
pkgver=1.4.0
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
sha256sums_aarch64=('56646a0403433b9fd3cefdcead868116929d69991074b39ee164171d0840863a')
sha256sums_x86_64=('da21041cae51be1e1f1c3eb49c19e4491e1483834724ae5f0373e5991fc08ce2')
package() {
	install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
}
