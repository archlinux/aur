# Maintainer: Alif Rachmawadi <code@subosito.com>

pkgname=snowboard
pkgver=0.6.1
pkgrel=1
pkgdesc="API blueprint parser and renderer"
arch=('x86_64')
url="https://github.com/subosito/snowboard"
license=('MIT')
source=("LICENSE")
source_x86_64=("https://github.com/subosito/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.linux-amd64.tar.gz")
sha256sums=("7735b9ba5dcaff4118d2bb06aa2dfa598ee87fe3da1de71a8b74a39c21b91191")
sha256sums_x86_64=("9e869e264f78b843d4ad06a98384c2163f8514d601d8375627ffaa6cf91ab364")

package() {
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
