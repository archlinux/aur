# Maintainer: zoe <chp321 AT gmail DOT com>

pkgname=kf5-servicemenus-copypath
_srcname=copypath
pkgver=0.3
pkgrel=3
pkgdesc="A service menu to put the path of a file or directory into the Klipper queue"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dolphin' 'kdialog' 'bash' 'oxygen-icons')
source=(${_srcname}.sh ${_srcname}.desktop ${_srcname}.install)
sha1sums=('0821c7b40b69ea6409219101ffcb707d5597f295'
          '7577ac267c4dcedfdfd4f86ac87612df1c8f7914'
          '0693053176342793c1369ad7e8906cc6df8cf93b')
install=${_srcname}.install

package() {
	install -D -m755 ${_srcname}.sh ${pkgdir}/usr/bin/${_srcname}
	install -D -m644 ${_srcname}.desktop "${pkgdir}/$(kf5-config --prefix)/share/kservices5/ServiceMenus/${_srcname}.desktop"
}
