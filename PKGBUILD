# Maintainer: zoe <chp321 AT gmail DOT com>

pkgname=kf5-servicemenus-copypath
_srcname=copypath
pkgver=0.3
pkgrel=6
pkgdesc="A service menu to put the path of a file or directory into the Klipper queue"
arch=('i686' 'x86_64')
license=('GPL')
depends=('plasma-workspace' 'dolphin' 'kdialog' 'xclip' 'bash' 'oxygen-icons')
source=(${_srcname}.desktop ${_srcname}.install)
sha1sums=('a2b1c96f0742926d41e1118da90da0a16ca51316'
          '0693053176342793c1369ad7e8906cc6df8cf93b')
install=${_srcname}.install

package() {
	install -D -m644 ${_srcname}.desktop "${pkgdir}/$(qtpaths --install-prefix)/share/kservices5/ServiceMenus/${_srcname}.desktop"
}
