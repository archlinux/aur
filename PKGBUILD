# $Id$
# Contributor: Paul Nicholson <brenix@gmail.com>

_name=terraform-lsp
pkgname=terraform-lsp-bin
pkgver=0.0.7
pkgrel=1
pkgdesc="Language Server Protocol for Terraform"
arch=('x86_64')
url="https://github.com/juliosueiras/terraform-lsp"
license=('MIT')
source=("https://github.com/juliosueiras/${_name}/releases/download/v${pkgver}/${_name}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('38c3b3566b6fa88c89649c76eacbdfcc6738aa729a044d15e4637ec9703c8743')

package() {
  cd "${srcdir}"
  install -Dm755 ${_name} ${pkgdir}/usr/bin/${_name}
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${_name}/README.md
  install -Dm644 LICENSE ${pkgdir}/usr/share/doc/${_name}/LICENSE
}
