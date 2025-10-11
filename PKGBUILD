# Maintainer: r6eve <r6eve at acm dot org>

pkgname=selscan-bin
pkgver=v2.1.1
pkgrel=1
pkgdesc='Haplotype based scans for selection'
arch=('x86_64')
url='https://github.com/szpiech/selscan'
license=('GPL3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('92079a2f41ef9df494635e8fb112ef35beb41349837a1cbd6a6b5c7d4689fbb7')

package() {
  cd "${srcdir}/${pkgname%-bin}-${pkgver#v}"

  install -Dm0755 -t "${pkgdir}/usr/bin/" "bin/linux/${pkgname%-bin}"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "bin/linux/norm"
}
