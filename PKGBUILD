# Maintainer: Narthana Epa <narthana.epa+aur@gmail.com>

pkgname=kde-servicemenus-komparemenu
pkgver=0.1
pkgrel=2
pkgdesc="A KDE service menu for comparing selected files/folders with kompare"
url='http://example.com'
arch=('any')
license=('GPL')
depends=('kdebase-dolphin' 'kompare')
source=(komparemenu.desktop)
md5sums=('a45e7bed1c479d8e28c1c91e1b0affae')

package() {
	install -d ${pkgdir}/usr/share/kde4/services/ServiceMenus
	install ${srcdir}/komparemenu.desktop -t ${pkgdir}/usr/share/kde4/services/ServiceMenus
}
