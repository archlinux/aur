# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=python-obspy-docs
pkgver=1.4.1
pkgrel=1
pkgdesc='Set of HTML documentation for Obspy seismological framework.'
arch=('any')
url='http://docs.obspy.org'
license=('LGPL')
options=('docs')
source=("https://github.com/obspy/obspy/releases/download/${pkgver}/obspy-${pkgver}-documentation.tgz")
sha256sums=('17f70c48ea31804e40e3739aba26cc1cc09f5db9876aa7ed7c999546c06a5af6')

package() {
    install -d ${pkgdir}/usr/share/doc/python-obspy
    cp -r obspy-${pkgver}-documentation ${pkgdir}/usr/share/doc/python-obspy/html
    chmod -R a=rX,u=rwX ${pkgdir}/usr/share/doc/python-obspy/html
}
# vim:set ts=4 sw=4 et:
