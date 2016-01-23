# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs

pkgname="pushbullet-commons"
pkgver="0.4.0"
pkgrel="1"
pkgdesc="A library to work width pushbullet"
arch=('any')
url="http://www.atareao.es/tag/pushbullet/"
license=('GPL-3.0+')
depends=('python2')
makedepends=('python2-distutils-extra')
source=("https://launchpad.net/~atareao/+archive/ubuntu/atareao/+files/${pkgname}_${pkgver}-0extras14.04.1.tar.gz")
md5sums=('ff8fd8cd6a67c9b242fce2d1c13a6119')

build() {
	cd "${srcdir}/${pkgname}"
	python2 setup.py build
}

package() {
    cd "${srcdir}/${pkgname}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=4 sw=2 ft=sh et: