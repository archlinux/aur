# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=goodlink-bin
_pkgname=GoodLink
pkgver=2.5.22
pkgrel=1
pkgdesc="The simplest, zero-cost intranet penetration in the whole network, a single command directly connects any two hosts on the Internet.(Prebuilt version,written in Go)"
arch=(
    'aarch64'
    'armv7h'
    'i686'
    'x86_64'
)
url="https://gitee.com/konyshe/goodlink"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-arm64-cmd.zip")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-arm-cmd.zip")
source_i686=("${pkgname%-bin}-${pkgver}-i686.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-386-cmd.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-amd64-cmd.zip")
sha256sums_aarch64=('d5cd4da84c28534dd97a24378ffb46536f076dbbb18a79a8e6f835dda37d412f')
sha256sums_armv7h=('466abd7e2dad3455892db537e0a7159908af1293cb373dd90fbd9a0f9c0d05a3')
sha256sums_i686=('19e1f124c303a50c640cf46ada388948b00859390dd9ae2f45f61fb2eb485367')
sha256sums_x86_64=('233f9c2bb418aedb7cceacb17d987b95b4618d8ce8ff6feb5effeb3c05e5459e')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-linux-"*-cmd "${pkgdir}/usr/bin/${pkgname%-bin}"
}
