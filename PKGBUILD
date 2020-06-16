# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=python-obspy-docs
pkgver=1.2.0
pkgrel=1
pkgdesc='Set of HTML documentation for Obspy seismological framework.'
arch=('any')
url='http://docs.obspy.org'
license=('LGPL')
options=('docs')
source=(${pkgname}-${pkgver}.tgz::http://docs.obspy.org/archive/obspy-${pkgver}-documentation.tgz)
sha256sums=('aacb0b14f0c9955f5592b7858ea455e1d02d91fab3ba7f74f11b800daeb681a9')

package() {
    install -d ${pkgdir}/usr/share/doc/python-obspy
    cp -a obspy-${pkgver}-documentation/* \
        ${pkgdir}/usr/share/doc/python-obspy/
}
# vim:set ts=4 sw=4 et:
