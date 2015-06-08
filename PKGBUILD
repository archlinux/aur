# Maintainer: FadeMind <fademind@gmail.com>

pkgname=kde-servicemenus-thunderbird-attachment 
pkgver=1.1.2
pkgrel=1
pkgdesc="Attach to thunderbird service for Dolphin."
arch=('any')
url="http://opendesktop.org/content/show.php?content=122832"
license=('GPL')
depends=('kdebase-dolphin' 'thunderbird')
source=('thunderbird_attachment.desktop')
sha256sums=('f985f587f5598ace64075cdd4a1686cd39a8e8cb325b695549862b20da8d7331')

package() {
	cd ${srcdir}
	install -dm755 ${pkgdir}/usr/share/kde4/services/ServiceMenus/
	install -D -m644 thunderbird_attachment.desktop ${pkgdir}/usr/share/kde4/services/ServiceMenus/
}
