#Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>

pkgname=d3.js
pkgver=3.5.12
pkgrel=1
pkgdesc='A JavaScript library for producing dynamic, interactive data visualizations.'
arch=any
url='http://d3js.org/'
license='BSD'
source=("https://github.com/mbostock/d3/releases/download/v${pkgver}/d3.zip")
md5sums=('60d619b60231c3eff17e92a0fba2a409')

package() {  
  install -d ${pkgdir}/usr/share/javascript/${pkgname}
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  cp -a ${srcdir}/*.js ${pkgdir}/usr/share/javascript/${pkgname}/
  cp -a ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
