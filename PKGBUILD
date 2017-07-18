# Maintainer: David Parrish <daveparrish@tutanota.com>
# Maintainer: Trevor Bramble <inbox@trevorbramble.com>

pkgname=habitat-bin
pkgver=0.26.1
_builddate=20170715033447
pkgrel=1
pkgdesc="Application automation framework that allows you to build applications that have automation built-in"
arch=('x86_64')
url="https://www.habitat.sh/"
license=('Apache')
provides=('habitat')
conflicts=('habitat' 'habitat-git')
source=("https://dl.bintray.com/habitat/stable/linux/x86_64/hab-${pkgver}-${_builddate}-x86_64-linux.tar.gz")
sha256sums=('13567a76b9a24c1df1c6839e627e638a3726475df7e23075d96c9e588fbbfb0f')

package() {
  install -D -m755 "${srcdir}/hab-${pkgver}-${_builddate}-x86_64-linux/hab" "${pkgdir}/usr/bin/hab"
}
