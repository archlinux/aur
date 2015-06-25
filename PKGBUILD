# Maintainer: Acidhub <contact@acidhub.click>

_themename=acidhub
pkgname=sddm-${_themename}-theme
pkgver=0.2
pkgrel=2
pkgdesc='A hazardous style SDDM theme.'
arch=('any')
url='https://acidhub.click/'
license=('GPL3')

depends=('sddm')

install=${pkgname}.install

source=(
	"http://acidhub.click/downloads/${_themename}-${pkgver}.tar.gz"
	"${pkgname}.install"
)
sha512sums=('c4bd4689efacaa17e7c7a67418420e123e963f909f20846b4f0b0f20a4810efd38a36595568f33c4dd49b0d8ddf44d65ac3d64b1c43242259d8139a40f1a1f00'
            'fc57feb3cc1ecc7caf187efb0521dea9854f7c4bdeb15c3d960334ea9bf13f1230e1a39a5dccb56fa0f08b840f13607b9d366f7f5b2cb3f96cee921bb7877b8d')

package() {
	cd ${srcdir}
	msg2 "Installing theme..."
	mkdir -p ${pkgdir}/usr/share/sddm/themes
	cp -R ${_themename} ${pkgdir}/usr/share/sddm/themes
}
