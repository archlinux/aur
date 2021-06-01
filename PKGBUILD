# $Id$
# Contributor: Paul Nicholson <brenix@gmail.com>

_name=terraform-docs
pkgname=terraform-docs-bin
pkgver=0.14.1
pkgrel=1
pkgdesc="Generate docs from terraform modules"
arch=('x86_64')
url="https://github.com/terraform-docs/terraform-docs"
license=('MIT')
source=(${_name}-${pkgver}::"https://github.com/${_name}/${_name}/releases/download/v${pkgver}/${_name}-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('f0a46b13c126f06eba44178f901bb7b6b5f61a8b89e07a88988c6f45e5fcce19')

package() {
  cd "${srcdir}"
  install -Dm755 ${srcdir}/${_name}-${pkgver} ${pkgdir}/usr/bin/${_name}
}
