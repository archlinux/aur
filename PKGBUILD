# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=terraform-provider-alibabacloudstack-bin
pkgver=3.16.0
pkgrel=1
pkgdesc="Terraform Provider For AlibabacloudStack Cloud.(Prebuilt version)"
arch=(
    'aarch64'
    'armv7h'
    'i686'
    'x86_64'
)
url="https://github.com/aliyun/terraform-provider-alibabacloudstack"
license=('MPL-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('terraform>=0.13')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.zip")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm.zip")
source_i686=("${pkgname%-bin}-${pkgver}-i686.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_386.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.zip")
sha256sums_aarch64=('5494722b0474dd08cc2a276e2519ff52b21d20c1d728064b5c3cef5263b2aa72')
sha256sums_armv7h=('ce99beeae9271cf52078ca5f426d6570b65a7d7d73b7990027fe805c1d61583c')
sha256sums_i686=('e85cf7025b2480f6219b5f27f6239c5b55a9518fc7d693e8debfc7533367e792')
sha256sums_x86_64=('eac87ef6db7051aa1789e9a6e463bf969b2414b713950fb7253139d5b859b033')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}_v${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}