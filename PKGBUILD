# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=terraform-provider-alicloud-bin
pkgver=1.267.0
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
sha256sums_aarch64=('ab7f3640fff8c2d7ef10bbfaf57c405c2354d66b4ee50970a5cb17f820dc6fc4')
sha256sums_armv7h=('00784458cb1eb26b46a219d6051c1fb0ecfbd96f321e7950acf268bb9d82caba')
sha256sums_i686=('2df865ef708ddf438a4bac85b1b8cbdf9775b51d966e33591f1e23f519f7f5bd')
sha256sums_x86_64=('6025654339795ebda6374ec1740bcbae9d954a9a76a237205db19314172267f8')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}_v${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
