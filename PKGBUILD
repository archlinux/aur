# Maintainer: Jonathan Wright <jon@than.io>
# Contributer: ripping1903 <ripping1903 at proton dot me>
# Contributor: Paul Nicholson <brenix@gmail.com>

_name=terraform-docs
pkgname=terraform-docs-bin
pkgver=0.24.0
pkgrel=1
pkgdesc="Generate documentation from Terraform modules in various output formats"
arch=('x86_64')
url="https://github.com/terraform-docs/terraform-docs"
license=('MIT')
source=("https://github.com/${_name}/${_name}/releases/download/v${pkgver}/${_name}-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('9005daf969de0b50134493a2c00078b49f5f5b39d021cda7c89bf4d4f3d776d3')

package() {
  cd "${srcdir}"
  install -Dm755 ${srcdir}/${_name} ${pkgdir}/usr/bin/${_name}
}
