# Maintainer: zoe <chp321 AT gmail DOT com>

pkgname=kf5-servicemenus-copypath
_srcname=CopyPath
pkgver=0.3
pkgrel=2
pkgdesc="A service menu to put the path of a file or directory into the Klipper queue"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/Copy+file+or+directory+path?content=112873"
license=('GPL')
depends=('dolphin' 'kdialog')
install=${pkgname}.install
source=(http://kde-apps.org/CONTENT/content-files/112873-${_srcname}.desktop)
sha1sums=('4357092af6d5969c34403295230df6eeb0b86640')

package() {
	install -D -m644 *-${_srcname}.desktop "${pkgdir}/$(kf5-config --prefix)/share/kservices5/ServiceMenus/copy_path.desktop"
}
