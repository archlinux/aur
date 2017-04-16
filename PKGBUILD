# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=habitat-bin
pkgver=0.20.0
_builddate=20170407021836
pkgrel=1
pkgdesc="Application automation framework that allows you to build applications that have automation built-in"
arch=('x86_64')
url="https://www.habitat.sh/"
license=('Apache')
source=("https://dl.bintray.com/habitat/stable/linux/x86_64/hab-${pkgver}-${_builddate}-x86_64-linux.tar.gz")
sha256sums=('72ede8aadfcb7cd4883adbff8decbf0eeb69dd34a53033159aa8292b6ee3fdbd')

package() {
  install -D -m755 "${srcdir}/hab-${pkgver}-${_builddate}-x86_64-linux/hab" "${pkgdir}/usr/bin/hab"
}
