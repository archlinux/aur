# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=habitat-bin
pkgver=0.23.0
_builddate=20170511215221
pkgrel=1
pkgdesc="Application automation framework that allows you to build applications that have automation built-in"
arch=('x86_64')
url="https://www.habitat.sh/"
license=('Apache')
source=("https://dl.bintray.com/habitat/stable/linux/x86_64/hab-${pkgver}-${_builddate}-x86_64-linux.tar.gz")
sha256sums=('8966017300be843b969d358ade38b6e1740169b6de556c7979e62f0531ee8a16')

package() {
  install -D -m755 "${srcdir}/hab-${pkgver}-${_builddate}-x86_64-linux/hab" "${pkgdir}/usr/bin/hab"
}
