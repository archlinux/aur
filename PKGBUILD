# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Camas Millar <camas at hotmail dot co dot uk>
# Contributor: smt <smt923 at protonmail dot com>
pkgname=ffuf-bin
pkgver=2.2.1
pkgrel=1
pkgdesc="Fast web fuzzer written in Go"
arch=(
    'aarch64'
    'armv7h'
    'i686'
    'x86_64'
)
url="https://github.com/ffuf/ffuf"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_386.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums_aarch64=('89ad4f50345e6a9a48ecc8d241811d582cedf96279276b48d666b12b31260484')
sha256sums_armv7h=('89ad4f50345e6a9a48ecc8d241811d582cedf96279276b48d666b12b31260484')
sha256sums_i686=('f860728c8b83db65a68f7327ccad1f346592548fc097559d1dd4939fd89aa9a4')
sha256sums_x86_64=('86307885810d3c36ba4a3e9ba5178c2d9027bba0dd7f4ea39e39e7c972b62396')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin/"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
