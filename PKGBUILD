# Maintainer: r6eve <r6eve at acm dot org>

pkgname=plink-bin
pkgver=v1.90b6.26
pkgrel=1
pkgdesc='A comprehensive update to the PLINK association analysis toolset'
arch=('x86_64')
url='https://www.cog-genomics.org/plink2'
license=('GPL3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}.zip"::"https://s3.amazonaws.com/plink1-assets/${pkgname%-bin}_linux_${arch}_20220402.zip")
sha256sums=('4777e2535d0de1415f1a6f0fe81378a7fcf59f930eb9b7cbec93c7bee58fd1cc')

package() {
  install -Dm0755 -t "${pkgdir}/usr/bin/" "${pkgname%-bin}"
}
