# $Id$
# Contributor: Paul Nicholson <brenix@gmail.com>

_name=terraform-lsp
pkgname=terraform-lsp-bin
pkgver=0.0.5
pkgrel=1
pkgdesc="Language Server Protocol for Terraform"
arch=('x86_64')
url="https://github.com/juliosueiras/terraform-lsp"
license=('MIT')
source=("https://github.com/juliosueiras/${_name}/releases/download/v${pkgver}/${_name}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('7785e0d8ae157d2bc6a867b0b5d31a6cea62ebaac001e4cbca049eaa53dd1225')

package() {
  cd "${srcdir}"
  install -Dm755 ${_name} ${pkgdir}/usr/bin/${_name}
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${_name}/README.md
  install -Dm644 LICENSE ${pkgdir}/usr/share/doc/${_name}/LICENSE
}
