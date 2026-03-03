# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=terraform-provider-alicloud-bin
pkgver=1.272.1
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
sha256sums_aarch64=('d0ffeb13aea6a9dc6c3c950795ae271d74f8233e2ea2796d7c24042afa5f297b')
sha256sums_armv7h=('0bdac42bfe638caaea9420932bebeee3fdf8945e7330e606445a357a7f053ee3')
sha256sums_i686=('ab7ac8f25a124a5cd867c6050efd473f9a7ed37aaa88b5346304bf4336757e9a')
sha256sums_x86_64=('89098740ac8e35111540333e8a16978a34101bc43dfc3e488ced5afcc6ef2c34')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}_v${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
