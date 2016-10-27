# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=python-obspy-docs
pkgver=1.0.2
pkgrel=1
pkgdesc='Set of HTML documentation for Obspy seismological framework.'
arch=('any')
url='http://docs.obspy.org'
license=('LGPL')
options=('docs')
source=(${pkgname}-${pkgver}.tgz::http://docs.obspy.org/archive/obspy-${pkgver}-documentation.tgz)
md5sums=('cc25ce753ee4cf19d24ec93dee2afea1')

package() {
  install -d ${pkgdir}/usr/share/doc/python-obspy
	cp -a ${srcdir}/${pkgver}/* \
    ${pkgdir}/usr/share/doc/python-obspy/
}
