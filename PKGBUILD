# Maintainer: Marco Steiger <marco (at) steiger (dot) online>
pkgname=buffalo
pkgver=0.15.0
pkgrel=1
pkgdesc='A Go web development eco-system, designed to make your project easier.'
url="https://github.com/gobuffalo/buffalo/"
arch=('x86_64')
license=('MIT')
makedepends=('tar')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gobuffalo/buffalo/releases/download/v${pkgver}/buffalo_${pkgver}_linux_amd64.tar.gz")
sha256sums=('873c6d0805eed76d8c7a6c129b7b18a6c4cc049c7d5db0257c5dc8e601d8cf5b')

package() {
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
