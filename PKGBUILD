# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=terraform-provider-alibabacloudstack-bin
pkgver=3.18.19
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
sha256sums_aarch64=('d59bf1bc11390fd63f61e133c09b4a73034066226e9bf4d1a5846ec8cb014645')
sha256sums_armv7h=('e602b9d542b6bdd79d83a5a86b7deb345ba5aeac3ff9024fec6511e6e2c3c46f')
sha256sums_i686=('4ef2985c7f18c88f0c59cfc7faac7aa183c403d8961abb96a991964df69d4f11')
sha256sums_x86_64=('d8d2ccd5f8a3f7f33ed80d13929d6725c59e6c70d9e639287972f7e0e3b14338')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}_v${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
