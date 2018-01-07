# $Id: PKGBUILD 310007 2017-11-15 14:11:34Z foutrelis $
# Maintainer: Daniel Isenmann <daniel@archlinux.org>

pkgbase=python-wpactrl
pkgname=python2-wpactrl
pkgver=20090609
pkgrel=6
pkgdesc="A Python extension for wpa_supplicant/hostapd control interface access"
arch=('x86_64')
url="http://projects.otaku42.de/wiki/PythonWpaCtrl"
license=('GPL2')
depends=('python2')
conflicts=('python-wpactrl<=20090609-3')
replaces=('python-wpactrl<=20090609-3')
source=(https://sources.archlinux.org/other/${pkgbase}/python-wpactrl-20090609.tar.gz)
md5sums=('8d45739aa9bfa1110a4570bb5ceda768')

build() {
	cd "${srcdir}/${pkgbase}-${pkgver}"
	python2 setup.py build
}

package_python2-wpactrl() {
	cd "${srcdir}/${pkgbase}-${pkgver}"
	python2 setup.py install --root="${pkgdir}"
}
