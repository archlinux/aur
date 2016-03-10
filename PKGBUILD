#Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>

pkgname=d3.js
pkgver=3.5.16
pkgrel=1
pkgdesc='A JavaScript library for producing dynamic, interactive data visualizations.'
arch=('any')
url='http://d3js.org/'
license=('BSD')
source=("https://github.com/mbostock/d3/releases/download/v${pkgver}/d3.zip")
md5sums=('c2e124d44873a7a096f596f294950fe7')

package() {  
  install -d ${pkgdir}/usr/share/javascript/${pkgname}
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  cp -a ${srcdir}/*.js ${pkgdir}/usr/share/javascript/${pkgname}/
  cp -a ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
