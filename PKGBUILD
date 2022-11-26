# Maintainer:  Connor Worrell <connorkworrell@gmail.com>

pkgname=ttf-y145m-2009
pkgver=1
pkgrel=1
pkgdesc='ASME-Y14.5M-2009 Geometric Dimensioning and Tolerancing Font'
arch=('any')
url='https://www.wfonts.com/font/y14-5m-2009'
license=('custom:USA Public Domain')
source=("https://www.wfonts.com/download/data/2016/04/25/y14-5m-2009/y14-5m-2009.zip")
sha256sums=('fd1e9ac2dcdbe6c09cf472f82347b0734d5d3a2c774892501700550eeca3d1c5')

package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
  install -m 644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"
}
