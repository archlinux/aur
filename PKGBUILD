# Maintainer: r6eve <r6eve at acm dot org>

pkgname=selscan-bin
pkgver=v3.0.0
pkgrel=1
pkgdesc='Haplotype based scans for selection'
arch=('x86_64')
url='https://github.com/szpiech/selscan'
license=('GPL3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
source=("${pkgname%-bin}"::"${url}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-linux")
sha256sums=('add1c9f6f081c92470487744b7768b6dd229e4268d2f4f3b0433e548ba793b8e')

package() {
  install -Dm0755 -t "${pkgdir}/usr/bin/" "${pkgname%-bin}"
}
