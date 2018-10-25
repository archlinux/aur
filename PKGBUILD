# $Id$
# Contributor: Paul Nicholson <brenix@gmail.com>

_name=terraform-docs
pkgname=terraform-docs-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Generate docs from terraform modules"
arch=('x86_64')
url="https://github.com/segmentio/terraform-docs"
license=('MIT')
source=("https://github.com/segmentio/${_name}/releases/download/v${pkgver}/${_name}-v${pkgver}-linux-amd64")
sha256sums=('dbd421c78089fad336afda3d3969abd34e05889bfd24ae91debde16dab5a144a')

package() {
  cd "${srcdir}"
  install -Dm755 ${_name}-v${pkgver}-linux-amd64 ${pkgdir}/usr/bin/${_name}
}
