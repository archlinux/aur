# $Id$
# Contributor: Paul Nicholson <brenix@gmail.com>

_name=terraform-lsp
pkgname=terraform-lsp-bin
pkgver=0.0.10
pkgrel=1
pkgdesc="Language Server Protocol for Terraform"
arch=('x86_64')
url="https://github.com/juliosueiras/terraform-lsp"
license=('MIT')
source=("https://github.com/juliosueiras/${_name}/releases/download/v${pkgver}/${_name}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('73624dde3d1bad07eb482534af56570e2b7218d3fd47fc0c0ea8fbb0c7a7d07a')

package() {
  cd "${srcdir}"
  install -Dm755 ${_name} ${pkgdir}/usr/bin/${_name}
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${_name}/README.md
  install -Dm644 LICENSE ${pkgdir}/usr/share/doc/${_name}/LICENSE
}
