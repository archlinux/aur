# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=goodlink-bin
_pkgname=GoodLink
pkgver=2.4.13
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
sha256sums_aarch64=('b4e7368c50ec555084bd02d80ce81eb0157f20f841160eeae0c3688ca77286ca')
sha256sums_armv7h=('ec9123edc8aee11b33cf9cdac447c568e8dcbee30bbba86f523654511e14504a')
sha256sums_i686=('e94fe7c45072fcc35573c68252d6d27cb0e209de40bc4fbb60f369b0f5cddc81')
sha256sums_x86_64=('dea15d8d44a7892bf426bd60d0b2fbe9d2f434288015c2072850823ab9f0fc1e')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-linux-"*-cmd "${pkgdir}/usr/bin/${pkgname%-bin}"
}
