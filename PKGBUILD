# Maintainer: Mario Rubio <mario.hi52 at gmail dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=d3.js
pkgver=4.7.3
pkgrel=1
pkgdesc='A JavaScript library for producing dynamic, interactive data visualizations.'
arch=('any')
url='http://d3js.org/'
license=('BSD')
source=("https://github.com/mbostock/d3/releases/download/v${pkgver}/d3.zip")
md5sums=('7177f1f6c91cdefbe193102cae62ed74')

package() {  
  install -d ${pkgdir}/usr/share/javascript/${pkgname}
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  cp -a ${srcdir}/*.js ${pkgdir}/usr/share/javascript/${pkgname}/
  cp -a ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
