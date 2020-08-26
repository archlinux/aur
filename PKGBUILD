# $Id$
# Contributor: Paul Nicholson <brenix@gmail.com>

_name=terraform-lsp
pkgname=terraform-lsp-bin
pkgver=0.0.11
pkgrel=1
pkgdesc="Language Server Protocol for Terraform"
arch=('x86_64')
url="https://github.com/juliosueiras/terraform-lsp"
license=('MIT')
source=("https://github.com/juliosueiras/${_name}/releases/download/v${pkgver}-beta2/${_name}_${pkgver}-beta2_linux_amd64.tar.gz")
sha256sums=('bcdc21dd89fc4e4b1d79078ac256415c8199671cb64aae571c07ad92dc20332d')

package() {
  cd "${srcdir}"
  install -Dm755 ${_name} ${pkgdir}/usr/bin/${_name}
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${_name}/README.md
  install -Dm644 LICENSE ${pkgdir}/usr/share/doc/${_name}/LICENSE
}
