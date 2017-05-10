# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=habitat-bin
pkgver=0.22.1
_builddate=20170509234454
pkgrel=1
pkgdesc="Application automation framework that allows you to build applications that have automation built-in"
arch=('x86_64')
url="https://www.habitat.sh/"
license=('Apache')
source=("https://dl.bintray.com/habitat/stable/linux/x86_64/hab-${pkgver}-${_builddate}-x86_64-linux.tar.gz")
sha256sums=('80209c8768b704a513c15803a91c394e2f8f30b9f973eeccf7c1e0b25fb8165f')

package() {
  install -D -m755 "${srcdir}/hab-${pkgver}-${_builddate}-x86_64-linux/hab" "${pkgdir}/usr/bin/hab"
}
