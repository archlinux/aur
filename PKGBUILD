# $Id$
# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=python-obspy-docs
pkgver=1.1.0
pkgrel=1
pkgdesc='Set of HTML documentation for Obspy seismological framework.'
arch=('any')
url='http://docs.obspy.org'
license=('LGPL')
options=('docs')
source=(${pkgname}-${pkgver}.tgz::http://docs.obspy.org/archive/obspy-${pkgver}-documentation.tgz)
sha256sums=('4647c65fbb38ed42c32862bc6e8d6cc84cc69880d32a81ecbe16101ee6f7a0dc')

package() {
  install -d ${pkgdir}/usr/share/doc/python-obspy
  cp -a obspy-${pkgver}-documentation/* \
    ${pkgdir}/usr/share/doc/python-obspy/
}
# vim:set ts=2 sw=2 et:
