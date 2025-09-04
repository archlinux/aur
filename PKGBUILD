# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=terraform-provider-alibabacloudstack-bin
pkgver=3.18.14
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
sha256sums_aarch64=('d3e58a076697470b7e626c9c3f5a98871fddb8081c8d5117fd1c80f4e537fa69')
sha256sums_armv7h=('8172442dca66302af65a93e38b6f2176165543651be52c91f961a5f6958cba17')
sha256sums_i686=('c43dbdf4cc5c0edfbeb051d08d25399b942ec2de0fe7dd924d7a3fc6f4127915')
sha256sums_x86_64=('bca2d5296df12556dde86b3991a3e766ea7c7a9bd2589b707c8ad1f1873dc5e5')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}_v${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}