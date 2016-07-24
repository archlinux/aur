# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs

pkgname="pushbullet-commons"
pkgver="0.5.6"
pkgrel="1"
pkgdesc="A library to work width pushbullet"
arch=('any')
url="https://www.atareao.es/apps/pushbullet-indicator-para-enviar-archivos-entre-ubuntu-y-android/"
license=('GPL3')
depends=('python2')
makedepends=('python2-distutils-extra')
source=("https://launchpad.net/~atareao/+archive/ubuntu/pushbullet/+files/${pkgname}_${pkgver}-0extras16.04.4.tar.xz")
sha256sums=('c8d597cb3c15e27073e6e4914a7673a48e9a3112c168d2bbe680ff7f429f2336')

build() {
	cd "${srcdir}/${pkgname}"
	python2 setup.py build
}

package() {
    cd "${srcdir}/${pkgname}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=4 sw=2 ft=sh et:
