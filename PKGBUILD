# Maintainer: r6eve <r6eve at acm dot org>

pkgname=plink-bin
pkgver=v1.90b6.25
pkgrel=1
pkgdesc='A comprehensive update to the PLINK association analysis toolset'
arch=('x86_64')
url='https://www.cog-genomics.org/plink2'
license=('GPL3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}.zip"::"https://s3.amazonaws.com/plink1-assets/${pkgname%-bin}_linux_${arch}_20220305.zip")
sha256sums=('2390a5dda9659d619d38976abe2078e03d9e4899e4ffe8ced78bd9cae74b69ec')

package() {
  install -Dm0755 -t "${pkgdir}/usr/bin/" "${pkgname%-bin}"
}
