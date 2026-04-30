# Maintainer: r6eve <r6eve at acm dot org>

pkgname=selscan-bin
pkgver=v3.0.1
pkgrel=1
pkgdesc='Haplotype based scans for selection'
arch=('x86_64')
url='https://github.com/szpiech/selscan'
license=('GPL3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
source=("${pkgname%-bin}"::"${url}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-linux")
sha256sums=('dfe41ef6c42bea2017891c0ac0617091c23a43568b625e28df6175580c1357c7')

package() {
  install -Dm0755 -t "${pkgdir}/usr/bin/" "${pkgname%-bin}"
}
