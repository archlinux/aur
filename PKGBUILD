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
            '95979e46ddd2b144da223aae01427c952baf37ff58dbc7b149884e02a1d489cc')
package() {
	mkdir -p ${pkgdir}/usr/share/kservices5/ServiceMenus/
	mkdir -p ${pkgdir}/usr/share/new_folder_with_selection/	

	install -m 755 new_folder_with_selection.sh ${pkgdir}/usr/share/new_folder_with_selection/
	install -m644 new_folder_with_selection.desktop ${pkgdir}/usr/share/kservices5/ServiceMenus/
}
