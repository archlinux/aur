# Maintainer: Jonathan Wright <jon@than.io>
# Contributer: ripping1903 <ripping1903 at proton dot me>
# Contributor: Paul Nicholson <brenix@gmail.com>

_name=terraform-docs
pkgname=terraform-docs-bin
pkgver=0.25.1
pkgrel=1
pkgdesc="Generate documentation from Terraform modules in various output formats"
arch=('x86_64')
url="https://github.com/terraform-docs/terraform-docs"
license=('MIT')
source=("https://github.com/${_name}/${_name}/releases/download/v${pkgver}/${_name}-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('246f1a3211c9dbbed4c4af82b856dbd40acda78816ac8cdb5203c2869b659c76')

package() {
  cd "${srcdir}"
  install -Dm755 ${srcdir}/${_name} ${pkgdir}/usr/bin/${_name}
}
