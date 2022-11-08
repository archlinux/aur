# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=python-obspy-docs
pkgver=1.3.1
pkgrel=1
pkgdesc='Set of HTML documentation for Obspy seismological framework.'
arch=('any')
url='http://docs.obspy.org'
license=('LGPL')
options=('docs')
source=("https://github.com/obspy/obspy/releases/download/${pkgver}/obspy-${pkgver}-documentation.tgz")
sha256sums=('bf9674ade7f351c59c0ef016c9714212d1c99ef0bcd2c9743644aa878a2a8d14')

package() {
    install -d ${pkgdir}/usr/share/doc/python-obspy
    cp -r obspy-documentation-${pkgver} ${pkgdir}/usr/share/doc/python-obspy/html
    chmod -R a=rX,u=rwX ${pkgdir}/usr/share/doc/python-obspy/html
}
# vim:set ts=4 sw=4 et:
