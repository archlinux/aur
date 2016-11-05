#Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=d3.js
pkgver=4.3.0
pkgrel=1
pkgdesc='A JavaScript library for producing dynamic, interactive data visualizations.'
arch=('any')
url='http://d3js.org/'
license=('BSD')
source=("https://github.com/mbostock/d3/releases/download/v${pkgver}/d3.zip")
md5sums=('ab5fe91a7f276821cf1fd910e688b5b6')

package() {  
  install -d ${pkgdir}/usr/share/javascript/${pkgname}
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  cp -a ${srcdir}/*.js ${pkgdir}/usr/share/javascript/${pkgname}/
  cp -a ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
