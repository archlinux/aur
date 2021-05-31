# $Id$
# Contributor: Paul Nicholson <brenix@gmail.com>

_name=terraform-docs
pkgname=terraform-docs-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="Generate docs from terraform modules"
arch=('x86_64')
url="https://github.com/terraform-docs/terraform-docs"
license=('MIT')
source=(${_name}-${pkgver}::"https://github.com/${_name}/${_name}/releases/download/v${pkgver}/${_name}-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('c23b677937561b70d917ac33bbd46e29812177060cde7d37d4c253469a6cf84b')

package() {
  cd "${srcdir}"
  install -Dm755 ${srcdir}/${_name}-${pkgver} ${pkgdir}/usr/bin/${_name}
}
