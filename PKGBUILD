# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

_themename=urbanlifestyle
pkgname=sddm-${_themename}-theme
pkgver=0.1.4
pkgrel=1
pkgdesc='A simple and colorful SDDM theme.'
arch=('any')
url='https://github.com/AlfredoRamos/sddm-urbanlifestyle-theme'
license=('GPL3')

depends=('sddm')
optdepends=()
makedepends=()
provides=("${pkgname}=${pkgver}")

install=${pkgname}.install

source=(
	"${_themename}-${pkgver}.tar.gz::https://github.com/AlfredoRamos/${pkgname}/archive/${pkgver}.tar.gz"
	"${pkgname}.install"
)
sha512sums=(
	'04a2d07d55854dd437bb7d376e728a944b9580167fb1753d23ae5fad84f3ffb0a4cc047c87b61ce5286fc6c453b3fbca3f2ab677bb4809ba0dcb4d3150cd940d'
	'5b2fdb21db351c6aeb0d36ff74f54f217d50ee19bc60505fad547f7567ba1837569fbcff58a65d52d8097c6456825f42a05580f41369349a69f1baae06483bd9'
)

package() {
	# Installing theme
	cd ${srcdir}/${pkgname}-${pkgver}
	msg2 "Installing theme..."
	mkdir -p ${pkgdir}/usr/share/sddm/themes
	cp -R ./${_themename} ${pkgdir}/usr/share/sddm/themes
}