# Maintainer: Alif Rachmawadi <arch@subosito.com>

pkgname=snowboard
pkgver=1.5.0
pkgrel=1
pkgdesc="API blueprint toolkit"
arch=('x86_64')
url="https://github.com/bukalapak/snowboard"
license=('MIT')
source=("LICENSE")
source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.linux-amd64.tar.gz")
sha256sums=("7735b9ba5dcaff4118d2bb06aa2dfa598ee87fe3da1de71a8b74a39c21b91191")
sha256sums_x86_64=("fc70cc54a34c3e31b6c3137517fbc2d2c5cc4aa8b1ee30ba7d36fd4498af2bbe")

package() {
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
