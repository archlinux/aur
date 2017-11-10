# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Mario Rubio <mario.hi52 at gmail dot com>
pkgname=d3.js
pkgver=4.11.0
pkgrel=1
pkgdesc='A JavaScript library for producing dynamic, interactive data visualizations.'
arch=('any')
url='http://d3js.org/'
license=('BSD')
source=("https://github.com/mbostock/d3/releases/download/v${pkgver}/d3.zip")
sha256sums=('4ecf1295fd2c81647fba2be325f3048c520130f8fbe1760e28a65d94c91f459f')

package() {  
  install -d ${pkgdir}/usr/share/javascript/${pkgname}
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  cp -a ${srcdir}/*.js ${pkgdir}/usr/share/javascript/${pkgname}/
  cp -a ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
