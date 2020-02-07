# Maintainer: Marco Steiger <marco (at) steiger (dot) online>
pkgname=buffalo
pkgver=0.15.5
pkgrel=1
pkgdesc='A Go web development eco-system, designed to make your project easier.'
url="https://github.com/gobuffalo/buffalo/"
arch=('x86_64')
license=('MIT')
makedepends=('tar')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gobuffalo/buffalo/releases/download/v${pkgver}/buffalo_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('5bb92e070d3c8633fb0be5bd20698dd07c73272a16d80699deecd63d9f450697')

package() {
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
