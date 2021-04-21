# $Id$
# Contributor: Paul Nicholson <brenix@gmail.com>

_name=terraform-docs
pkgname=terraform-docs-bin
pkgver=0.12.1
pkgrel=1
pkgdesc="Generate docs from terraform modules"
arch=('x86_64')
url="https://github.com/terraform-docs/terraform-docs"
license=('MIT')
source=("https://github.com/${_name}/${_name}/releases/download/v${pkgver}/${_name}-v${pkgver}-linux-amd64")
sha256sums=('32c0611a33a9c83857240ce2095287a5329564f26acd04818da5156192ecf401')

package() {
  cd "${srcdir}"
  install -Dm755 ${_name}-v${pkgver}-linux-amd64 ${pkgdir}/usr/bin/${_name}
}
