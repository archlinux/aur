# $Id$
# Contributor: Paul Nicholson <brenix@gmail.com>

_name=terraform-docs
pkgname=terraform-docs-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Generate docs from terraform modules"
arch=('x86_64')
url="https://github.com/segmentio/terraform-docs"
license=('MIT')
source=("https://github.com/segmentio/${_name}/releases/download/v${pkgver}/${_name}-v${pkgver}-linux-amd64")
sha256sums=('7863f13b4fa94f7a4cb1eac2751c427c5754ec0da7793f4a34ce5d5d477f7c4f')

package() {
  cd "${srcdir}"
  install -Dm755 ${_name}-v${pkgver}-linux-amd64 ${pkgdir}/usr/bin/${_name}
}
