# Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>

pkgname=python-obspy-docs
pkgver=1.0.1
pkgrel=1
pkgdesc='Set of HTML documentation for Obspy seismological framework.'
arch=('any')
url='http://docs.obspy.org'
license=('LGPL')
options=('docs')
source=(${pkgname}-${pkgver}.tgz::http://docs.obspy.org/archive/obspy-${pkgver}-documentation.tgz)
sha256sums=('ca6f99053b9b82e74b30af82ce9e2e3e0bde1b4be7806e68aa80049033e087b5')

package() {
  install -d ${pkgdir}/usr/share/doc/python-obspy
	cp -a ${srcdir}/home/obspy/htdocs/docs/obspy-${pkgver}-documentation/* \
    ${pkgdir}/usr/share/doc/python-obspy/
}
