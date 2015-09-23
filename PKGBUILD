# Maintainer: zaps166 <spaz16 at wp dot pl>

pkgname=dolphin-kde4
pkgver=14.12.3
pkgrel=1
pkgdesc='Symlink to dolphinpart4'
arch=('i686' 'x86_64' 'armv7' 'armv6' 'armv5')
url='http://kde.org/applications/system/dolphin'
license=('GPL')
groups=('kde-applications' 'kdebase')
depends=('dolphinpart4')
conflicts=('dolphin')
provides=('dolphin')
source=('dolphin.desktop')
sha1sums=('cd0f7383eeda5b4120fd67e49364d4802ec604d5')

package()
{
	mkdir -p "${pkgdir}"/usr/bin
	mkdir -p "${pkgdir}"/usr/share/applications/kde4
	ln -s dolphin4 "${pkgdir}"/usr/bin/dolphin
	cp dolphin.desktop "${pkgdir}"/usr/share/applications/kde4
}
