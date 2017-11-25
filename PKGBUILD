# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=d3js
pkgver=4.12.0
pkgrel=1
pkgdesc='A JavaScript library for producing dynamic, interactive data visualizations.'
arch=('any')
url='http://d3js.org/'
license=('BSD')
provides=('d3.js')
conflicts=('d3.js')
replaces=('d3.js')
source=("https://github.com/mbostock/d3/releases/download/v${pkgver}/d3.zip")
sha256sums=('c1aec29cbbd3a3f798584d07cbffdfc090f3ea31768073ec88218eed4d859c23')

package() {  
  install -d ${pkgdir}/usr/share/javascript/${pkgname}
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  cp -a ${srcdir}/*.js ${pkgdir}/usr/share/javascript/${pkgname}/
  cp -a ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
# vim:set ts=2 sw=2 et:
