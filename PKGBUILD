# $Id$
# Contributor: Paul Nicholson <brenix@gmail.com>

_name=terraform-docs
pkgname=terraform-docs-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Generate docs from terraform modules"
arch=('x86_64')
url="https://github.com/segmentio/terraform-docs"
license=('MIT')
source=("https://github.com/segmentio/${_name}/releases/download/v${pkgver}/${_name}-v${pkgver}-linux-amd64")
sha256sums=('c5f37a9d5731c987e1d1a95bb6ec77261c483d51f659cbd9fbcabf2199fb8360')

package() {
  cd "${srcdir}"
  install -Dm755 ${_name}-v${pkgver}-linux-amd64 ${pkgdir}/usr/bin/${_name}
}
