# Maintainer: BasioMeusPuga <disgruntled.mob@gmail.com>

pkgname=kde-servicemenus-newfolderwithselection
pkgver=1.0
pkgrel=1
pkgdesc="A KDE service menu for creating a new folder with selection (in Dolphin)"
url="https://aur.archlinux.org/packages/${pkgname}"
arch=('any')
license=('GPL')
depends=('dolphin')
source=('new_folder_with_selection.desktop' 'new_folder_with_selection.sh')
sha256sums=('b5c13fd2a196e1b0976dc2485774fefb32f1e39b1b84dc72f7bd849649697eb1'
            '7ff641e263c93fa61809567861ab54de9091dc557d396d22ee0fa46988d7fe7e')

package() {
	mkdir -p ${pkgdir}/usr/share/kservices5/ServiceMenus/
	mkdir -p ${pkgdir}/usr/share/new_folder_with_selection/	

	install -m 755 new_folder_with_selection.sh ${pkgdir}/usr/share/new_folder_with_selection/
	install -m644 new_folder_with_selection.desktop ${pkgdir}/usr/share/kservices5/ServiceMenus/
}
