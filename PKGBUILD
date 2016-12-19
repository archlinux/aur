# Maintainer: zoe <chp321 AT gmail DOT com>

pkgname=kf5-servicemenus-copypath
_srcname=copypath
pkgver=0.3
pkgrel=4
pkgdesc="A service menu to put the path of a file or directory into the Klipper queue"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dolphin' 'kdialog' 'bash' 'oxygen-icons')
source=(${_srcname}.desktop ${_srcname}.install)
sha1sums=('922082fc865beeb66a1bb82d3a34842b72b9baf1'
          '0693053176342793c1369ad7e8906cc6df8cf93b')
install=${_srcname}.install

package() {
	install -D -m644 ${_srcname}.desktop "${pkgdir}/$(kf5-config --prefix)/share/kservices5/ServiceMenus/${_srcname}.desktop"
}
