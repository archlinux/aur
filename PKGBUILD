# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=habitat-bin
pkgver=0.22.0
_builddate=20170506041148
pkgrel=1
pkgdesc="Application automation framework that allows you to build applications that have automation built-in"
arch=('x86_64')
url="https://www.habitat.sh/"
license=('Apache')
source=("https://dl.bintray.com/habitat/stable/linux/x86_64/hab-${pkgver}-${_builddate}-x86_64-linux.tar.gz")
sha256sums=('8a2daffea071b519b8f5e8984628d438934125e593b4e2a35ab58bb294e4dde8')

package() {
  install -D -m755 "${srcdir}/hab-${pkgver}-${_builddate}-x86_64-linux/hab" "${pkgdir}/usr/bin/hab"
}
