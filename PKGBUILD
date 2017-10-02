# Maintainer: David Parrish <daveparrish@tutanota.com>
# Maintainer: Trevor Bramble <inbox@trevorbramble.com>

pkgname=habitat-bin
pkgver=0.34.1
_builddate=20171002002928
pkgrel=1
pkgdesc="Application automation framework that allows you to build applications that have automation built-in"
arch=('x86_64')
url="https://www.habitat.sh/"
license=('Apache')
provides=('habitat')
conflicts=('habitat' 'habitat-git')
source=("https://dl.bintray.com/habitat/stable/linux/${arch}/hab-${pkgver}-${_builddate}-${arch}-linux.tar.gz")
sha256sums=('a4d56f3e7f15f621ebfe424b6ba0f1a1574833bd12769e7101c712086df61127')

package() {
  install -D -m755 "${srcdir}/hab-${pkgver}-${_builddate}-${arch}-linux/hab" "${pkgdir}/usr/bin/hab"
}
