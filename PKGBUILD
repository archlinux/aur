# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=skm-bin
pkgver=0.8.6
pkgrel=2
pkgdesc="A simple and powerful SSH keys manager"
arch=(
    'aarch64'
    'i686'
    'x86_64'
)
url="https://timothyye.github.io/skm"
_ghurl="https://github.com/TimothyYe/skm"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux_arm64.tar.gz")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux_i386.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux_x86_64.tar.gz")
sha256sums_aarch64=('e1c91bf31f2cf50e403b271e57cb92aa0edfe45d14e693cc39cb89c43e00c09a')
sha256sums_i686=('c28716920e95131fc1de98ba3ed3c28bb3dfb1fec8aef3e27bc956c64ad83315')
sha256sums_x86_64=('5e1a4d476f513ae71de9cf12de5563b27a2e5fb74b39e062955195812f1ddaf5')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}