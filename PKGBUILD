# Maintainer: zoe <chp321 AT gmail DOT com>

pkgname=kde-servicemenus-copypath
_srcname=CopyPath
pkgver=0.3
pkgrel=3
pkgdesc="A service menu to put the path of a file or directory into the Klipper queue"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/Copy+file+or+directory+path?content=112873"
license=('GPL')
depends=('kdebase-dolphin')
install=${pkgname}.install
source=(http://kde-apps.org/CONTENT/content-files/112873-${_srcname}.desktop)
sha1sums=('4357092af6d5969c34403295230df6eeb0b86640')

package() {
	install -D -m644 *-${_srcname}.desktop "${pkgdir}/$(kde4-config --prefix)/share/kde4/services/ServiceMenus/copy_path.desktop"
}