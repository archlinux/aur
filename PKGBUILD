# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=d3js
pkgver=4.13.0
pkgrel=1
pkgdesc='A JavaScript library for producing dynamic, interactive data visualizations.'
arch=('any')
url='http://d3js.org/'
license=('BSD')
provides=('d3.js')
conflicts=('d3.js')
source=("${pkgname}-${pkgver}.zip::https://github.com/mbostock/d3/releases/download/v${pkgver}/d3.zip")
sha256sums=('29288a2be82014ffa03f8ee1f8519bd43b71f09790409dcfa300ee3bb77fd81b')

package() {  
  install -d ${pkgdir}/usr/share/javascript/${pkgname}
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  cp -a ${srcdir}/*.js ${pkgdir}/usr/share/javascript/${pkgname}/
  cp -a ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
# vim:set ts=2 sw=2 et:
