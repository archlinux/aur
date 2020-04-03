# $Id$
# Contributor: Paul Nicholson <brenix@gmail.com>

_name=terraform-docs
pkgname=terraform-docs-bin
pkgver=0.9.1
pkgrel=1
pkgdesc="Generate docs from terraform modules"
arch=('x86_64')
url="https://github.com/segmentio/terraform-docs"
license=('MIT')
source=("https://github.com/segmentio/${_name}/releases/download/v${pkgver}/${_name}-v${pkgver}-linux-amd64")
sha256sums=('ceb4e7f291d43a5f7672f7ca9543075554bacd02cf850e6402e74f18fbf28f7e')

package() {
  cd "${srcdir}"
  install -Dm755 ${_name}-v${pkgver}-linux-amd64 ${pkgdir}/usr/bin/${_name}
}
