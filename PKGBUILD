# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=d3js
pkgver=5.4.0
pkgrel=1
pkgdesc='A JavaScript library for producing dynamic, interactive data visualizations.'
arch=('any')
url='http://d3js.org/'
license=('BSD')
provides=('d3.js')
conflicts=('d3.js')
source=("${pkgname}-${pkgver}.zip::https://github.com/d3/d3/releases/download/v${pkgver}/d3.zip")
sha256sums=('3c3aad0197a26b96b732524f586aeab2822b0a04e47d06abb89fea3a181ab2ca')

package() {  
  install -d ${pkgdir}/usr/share/javascript/${pkgname}
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  cp -a ${srcdir}/*.js ${pkgdir}/usr/share/javascript/${pkgname}/
  cp -a ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
# vim:set ts=2 sw=2 et:
