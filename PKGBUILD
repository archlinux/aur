# $Id$
# Maintainer: ripping1903 <ripping1903 at proton dot me>
# Contributor: Paul Nicholson <brenix@gmail.com>

_name=terraform-docs
pkgname=terraform-docs-bin
pkgver=0.18.0
pkgrel=1
pkgdesc="Generate docs from terraform modules"
arch=('x86_64')
url="https://github.com/terraform-docs/terraform-docs"
license=('MIT')
source=("https://github.com/${_name}/${_name}/releases/download/v${pkgver}/${_name}-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('7ccf78ca447e155ebf8ff0a390826283eded651d55b8e68cc534998f8f5fac2c')

package() {
  cd "${srcdir}"
  install -Dm755 ${srcdir}/${_name} ${pkgdir}/usr/bin/${_name}
}
