# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=momentjs-hijri
pkgver=2.0.0
pkgrel=1
pkgdesc='A Hijri calendar (Based on Umm al-Qura calculations) plugin for moment.js JavaScript library.'
arch=('any')
url='https://github.com/xsoh/moment-hijri'
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xsoh/moment-hijri/archive/v${pkgver}.tar.gz")
sha256sums=('a94675b467a0740bfde864841aeaa9622e684ca67c5285ec7abc01b4500808fc')

package() {  
  install -d ${pkgdir}/usr/share/javascript/${pkgname}
  cp -a ${srcdir}/moment-hijri-${pkgver}/moment-hijri.js ${pkgdir}/usr/share/javascript/${pkgname}/
}
# vim:set ts=2 sw=2 et:
