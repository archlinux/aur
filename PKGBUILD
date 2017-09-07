# Maintainer: Alif Rachmawadi <arch@subosito.com>

pkgname=snowboard
pkgver=1.0.0
pkgrel=1
pkgdesc="API blueprint toolkit"
arch=('x86_64')
url="https://github.com/bukalapak/snowboard"
license=('MIT')
source=("LICENSE")
source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.linux-amd64.tar.gz")
sha256sums=("7735b9ba5dcaff4118d2bb06aa2dfa598ee87fe3da1de71a8b74a39c21b91191")
sha256sums_x86_64=("312e20402717ad963571dde243aaad3e28f461ad55c00468b927bcca771c0b28")

package() {
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
