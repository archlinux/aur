# $Id$
# Contributor: Paul Nicholson <brenix@gmail.com>

_name=terraform-docs
pkgname=terraform-docs-bin
pkgver=0.17.0
pkgrel=1
pkgdesc="Generate docs from terraform modules"
arch=('x86_64')
url="https://github.com/terraform-docs/terraform-docs"
license=('MIT')
source=("https://github.com/${_name}/${_name}/releases/download/v${pkgver}/${_name}-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('8e436d0c44db49c2ccd95deede05c3deba324b34a274be06cd9ba9cdf644e795')

package() {
  cd "${srcdir}"
  install -Dm755 ${srcdir}/${_name} ${pkgdir}/usr/bin/${_name}
}
