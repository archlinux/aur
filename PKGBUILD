# Maintainer: Marco Steiger <marco (at) steiger (dot) online>
pkgname=buffalo
pkgver=0.15.1
pkgrel=1
pkgdesc='A Go web development eco-system, designed to make your project easier.'
url="https://github.com/gobuffalo/buffalo/"
arch=('x86_64')
license=('MIT')
makedepends=('tar')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gobuffalo/buffalo/releases/download/v${pkgver}/buffalo_${pkgver}_linux_amd64.tar.gz")
sha256sums=('c0668d16a03eb81c6df8f489b69a8ed14e1b030ccd32340550bb5e7671837541')

package() {
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
