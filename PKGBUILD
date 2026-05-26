# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=terraform-provider-alicloud-bin
pkgver=1.279.0
pkgrel=1
pkgdesc="Terraform AliCloud provider.(Prebuilt version)"
arch=(
    'aarch64'
    'armv7h'
    'i686'
    'x86_64'
)
url="https://www.terraform.io/docs/providers/alicloud/"
_ghurl="https://github.com/aliyun/terraform-provider-alicloud"
license=('MPL-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('terraform')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.zip")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm.zip")
source_i686=("${pkgname%-bin}-${pkgver}-i686.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_386.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.zip")
sha256sums_aarch64=('a5cd0ad127f5b5fe7d0b641379c062df122f2699c3d93fcdc9b26fa9091df170')
sha256sums_armv7h=('95f4f19acc2968a76fcf1b669ad4bdfadecb6abeeff1908d847fa96a6c3fae8c')
sha256sums_i686=('1f13a9990ac078934eda58b543822eb135028fd4f4b2bdb65c891ed5ac7baf56')
sha256sums_x86_64=('82321381b4f1f70c1931e5d5ca9f8df0eea4a8595cdf73c64c2dafd2a034aaa7')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}_v${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
