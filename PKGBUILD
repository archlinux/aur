# Maintainer: BasioMeusPuga <disgruntled.mob@gmail.com>

pkgname=kde-servicemenus-newfolderwithselection
pkgver=1.1
pkgrel=1
pkgdesc="A KDE service menu for creating a new folder with selection (in Dolphin)"
url="https://aur.archlinux.org/packages/${pkgname}"
arch=('any')
license=('GPL')
depends=('dolphin')
source=('new_folder_with_selection.desktop' 'new_folder_with_selection.sh')
sha256sums=('b5c13fd2a196e1b0976dc2485774fefb32f1e39b1b84dc72f7bd849649697eb1'
            '5c630db6f42ede7550fc4da1d1852c54f2c8f197b69d26778947e0d2d3caeddf')
package() {
	mkdir -p ${pkgdir}/usr/share/kservices5/ServiceMenus/
	mkdir -p ${pkgdir}/usr/share/new_folder_with_selection/	

	install -m 755 new_folder_with_selection.sh ${pkgdir}/usr/share/new_folder_with_selection/
	install -m644 new_folder_with_selection.desktop ${pkgdir}/usr/share/kservices5/ServiceMenus/
}
