# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=skm-bin
pkgver=0.9.3
pkgrel=1
pkgdesc="A simple and powerful SSH keys manager"
arch=(
    'aarch64'
    'armv7h'
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
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux_arm.tar.gz")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux_386.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux_amd64.tar.gz")
sha256sums_aarch64=('f1e875057339d72da7b51a58bb0474283de3f3c5dfe24c7696f5bd0aaac08bee')
sha256sums_armv7h=('4f43885c4f6dd0410652fcb72489fc12e86f1312655308b316f434bcf8210922')
sha256sums_i686=('05db5016924ad410be1c7cbc294763559c18d6579f5b2f7d2aed5682cd1ad681')
sha256sums_x86_64=('9ec81d386318de455e2b769753e280ca916ccc372150e8c72f968311941368c9')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
