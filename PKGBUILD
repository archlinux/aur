# Maintainer: FadeMind <fademind@gmail.com>

pkgname=kde-servicemenus-mktemplate
pkgver=20140503
pkgrel=1
pkgdesc="Create user templates from existing files."
arch=('any')
url="http://opendesktop.org/content/show.php?content=165089"
license=('GPL')
depends=('kdebase-dolphin' 'bash')
source=('mktemplate' 'mktemplate.desktop')
sha256sums=('6654f85ae29a8df1916e956f9ff4c157050573087693163c3f36bde4ff26ad86'
            '2687523aa3cb1161e15b82e5087b1f03fba9a81d1c70a64ee030fd73f8bc5066')

package() {
	cd ${srcdir}
	install -D -m755 mktemplate ${pkgdir}/usr/bin/mktemplate
	install -dm755 ${pkgdir}/usr/share/kde4/services/ServiceMenus/
	install -D -m644 mktemplate.desktop ${pkgdir}/usr/share/kde4/services/ServiceMenus/
}
