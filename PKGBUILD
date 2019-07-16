# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=python-obspy-docs
pkgver=1.1.1
pkgrel=1
pkgdesc='Set of HTML documentation for Obspy seismological framework.'
arch=('any')
url='http://docs.obspy.org'
license=('LGPL')
options=('docs')
source=(${pkgname}-${pkgver}.tgz::http://docs.obspy.org/archive/obspy-${pkgver}-documentation.tgz)
sha256sums=('f5cd6a62a100eb4ec2d72a2569448e5f79b1846540f58e8eadaf9461100e3664')

package() {
  install -d ${pkgdir}/usr/share/doc/python-obspy
  cp -a obspy-${pkgver}-documentation/* \
    ${pkgdir}/usr/share/doc/python-obspy/
}
# vim:set ts=2 sw=2 et:
