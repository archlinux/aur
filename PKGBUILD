# $Id$
# Maintainer: ripping1903 <ripping1903 at proton dot me>
# Contributor: Paul Nicholson <brenix@gmail.com>

_name=terraform-docs
pkgname=terraform-docs-bin
pkgver=0.19.0
pkgrel=1
pkgdesc="Generate docs from terraform modules"
arch=('x86_64')
url="https://github.com/terraform-docs/terraform-docs"
license=('MIT')
source=("https://github.com/${_name}/${_name}/releases/download/v${pkgver}/${_name}-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('dd741a0ece81059a478684b414d95d72b8b74fa58f50ac4036b4e8b56130d64b')

package() {
  cd "${srcdir}"
  install -Dm755 ${srcdir}/${_name} ${pkgdir}/usr/bin/${_name}
}
