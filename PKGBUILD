# Maintainer: Alif Rachmawadi <arch@subosito.com>

pkgname=snowboard
pkgver=1.6.0
pkgrel=1
pkgdesc="API blueprint toolkit"
arch=('x86_64')
url="https://github.com/bukalapak/snowboard"
license=('MIT')
source=("LICENSE")
source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.linux-amd64.tar.gz")
sha256sums=("7735b9ba5dcaff4118d2bb06aa2dfa598ee87fe3da1de71a8b74a39c21b91191")
sha256sums_x86_64=("333513ac0cce3a48c2833a2592a6c9ed97d67d5a726ab2bb3deee1266cdb4a29")

package() {
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
