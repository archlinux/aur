# Maintainer: r6eve <r6eve at acm dot org>

pkgname=selscan-bin
pkgver=v2.1
pkgrel=1
pkgdesc='Haplotype based scans for selection'
arch=('x86_64')
url='https://github.com/szpiech/selscan'
license=('GPL3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e5d36fb1ee9b5802f990a9b6e9181b5eaf4c3434033f14a9f4776aba4c9349ca')

package() {
  cd "${srcdir}/${pkgname%-bin}-${pkgver#v}"

  install -Dm0755 -t "${pkgdir}/usr/bin/" "bin/linux/${pkgname%-bin}"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "bin/linux/norm"
}
