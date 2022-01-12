# Maintainer: r6eve <r6eve at acm dot org>

pkgname=plink-bin
pkgver=v1.90b6.24
pkgrel=1
pkgdesc='A comprehensive update to the PLINK association analysis toolset'
arch=('x86_64')
url='https://www.cog-genomics.org/plink2'
license=('GPL3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}.zip"::"https://s3.amazonaws.com/plink1-assets/${pkgname%-bin}_linux_${arch}_20210606.zip")
sha256sums=('f29e06df665745bf2223a9e5d3c7ef9c70a11282c0e6e4b893989bc117a4edab')

package() {
  install -Dm0755 -t "${pkgdir}/usr/bin/" "${pkgname%-bin}"
}
