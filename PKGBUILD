# Maintainer: Alif Rachmawadi <code@subosito.com>

pkgname=snowboard
pkgver=0.6.4
pkgrel=1
pkgdesc="API blueprint parser and renderer"
arch=('x86_64')
url="https://github.com/subosito/snowboard"
license=('MIT')
source=("LICENSE")
source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.linux-amd64.tar.gz")
sha256sums=("7735b9ba5dcaff4118d2bb06aa2dfa598ee87fe3da1de71a8b74a39c21b91191")
sha256sums_x86_64=("0a8e2c8e8fd0cd9da09b4efe8c0a8ea5e679d9f48587bf4733ca790b45faef83")

package() {
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
