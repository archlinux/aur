# Maintainer: r6eve <r6eve at acm dot org>

pkgname=selscan-bin
pkgver=v2.0.0
pkgrel=1
pkgdesc='Haplotype based scans for selection'
arch=('x86_64')
url='https://github.com/szpiech/selscan'
license=('GPL3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2af823fe191311263687a73d270b1491dd70fa34cade138ad8a62b195a64bce3')

package() {
  cd "${srcdir}/${pkgname%-bin}-${pkgver#v}"

  install -Dm0755 -t "${pkgdir}/usr/bin/" "bin/linux/${pkgname%-bin}"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "bin/linux/norm"
}
