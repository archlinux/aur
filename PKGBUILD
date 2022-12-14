# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=python-obspy-docs
pkgver=1.4.0
pkgrel=1
pkgdesc='Set of HTML documentation for Obspy seismological framework.'
arch=('any')
url='http://docs.obspy.org'
license=('LGPL')
options=('docs')
source=("https://github.com/obspy/obspy/releases/download/${pkgver}/obspy-${pkgver}-documentation.tgz")
sha256sums=('d21c0628da938afabf3bd66c8c0fbdb67b3eb324d79993c39b90d5011069489c')

package() {
    install -d ${pkgdir}/usr/share/doc/python-obspy
    cp -r obspy-${pkgver}-documentation ${pkgdir}/usr/share/doc/python-obspy/html
    chmod -R a=rX,u=rwX ${pkgdir}/usr/share/doc/python-obspy/html
}
# vim:set ts=4 sw=4 et:
