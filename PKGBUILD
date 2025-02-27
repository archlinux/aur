# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=terraform-provider-alibabacloudstack-bin
pkgver=3.16.4
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
sha256sums_aarch64=('390ad56d336e9d6689ad1ce641c4aee8955c21caf895f88c7669ed002ef1ec89')
sha256sums_armv7h=('382f1ca19fee03586c535293f63db55f0050dd3f7c832116f9a8335333b2e8fe')
sha256sums_i686=('e6b2b095dd682e85dc509ec5bc33e7e88c99a45b6b1c6f67959fad9c95346915')
sha256sums_x86_64=('c1dbd63d3fe6ffb9dd6fade417586523336af4e5a39ec7de27413adfbeaa28d8')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}_v${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}