# $Id$
# Contributor: Paul Nicholson <brenix@gmail.com>

_name=terraform-docs
pkgname=terraform-docs-bin
pkgver=0.15.0
pkgrel=1
pkgdesc="Generate docs from terraform modules"
arch=('x86_64')
url="https://github.com/terraform-docs/terraform-docs"
license=('MIT')
source=("https://github.com/${_name}/${_name}/releases/download/v${pkgver}/${_name}-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('e0b399d9dc2eb97853a7e12f1ae678e7160cae4c811646ce70169a8d611f6cf9')

package() {
  cd "${srcdir}"
  install -Dm755 ${srcdir}/${_name} ${pkgdir}/usr/bin/${_name}
}
