# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=terraform-provider-alibabacloudstack-bin
pkgver=1.0.34
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
sha256sums_aarch64=('3e97a37b72fe92e2f11b0117bca66883962bfcf9d38e5d9fcab52f0baabe37a3')
sha256sums_armv7h=('45a7407f71250342be0da8d79dee168d1766746999de23be9fecc5d56de31174')
sha256sums_i686=('13e5232731de7e5e25fa2ed871e02d24519c12489e22fbcf1527a7d7bf197072')
sha256sums_x86_64=('edd3698ffd856f041d7d8ed88e75b1bd4c1cf2108a38a43ae48ca4768a3d252f')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}_v${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}