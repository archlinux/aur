# Maintainer: r6eve <r6eve at acm dot org>

pkgname=selscan-bin
pkgver=v2.1.2
pkgrel=1
pkgdesc='Haplotype based scans for selection'
arch=('x86_64')
url='https://github.com/szpiech/selscan'
license=('GPL3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8f5ec8be47d913141e5f294f9c11d3bbc336d8c4092b04cba01f3b0b0dd9bfff')

package() {
  cd "${srcdir}/${pkgname%-bin}-${pkgver#v}"

  install -Dm0755 -t "${pkgdir}/usr/bin/" "bin/linux/${pkgname%-bin}"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "bin/linux/norm"
}
