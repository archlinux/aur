# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Guillermo Garcia <ahioros@NO-SPAM.gmail.com>

pkgname=plymouth-theme-arch-logo
pkgver=0.1
pkgrel=5
pkgdesc='A remake of the ubuntu-logo Plymouth theme, based on the debian-logo theme, but featuring the Arch Linux logo.'
arch=('any')
#url='http://arch-stuff.org/content/show.php/Arch-logo+plymouth?content=141696'
url='http://karlinux.deviantart.com/art/Arch-Logo-Plymouth-Theme-209553250'
license=('GPL')
depends=('plymouth')
install="${pkgname}.install"
source=(
	# Mirrors
	#'http://arch-stuff.org/CONTENT/content-files/141696-Arch-logo-plymouth.tar.gz'
	'http://orig01.deviantart.net/455a/f/2011/140/5/0/arch_logo_plymouth_theme_by_karlinux-d3grgbm.zip'
)
sha256sums=(
	#'553ab3efd51abefc50c10b521c24183df9ef879d080a75c54fb1c1512fbc94e6'
	'85081ee41d773ca61281ad0bec9209f7b1f79bf5a21846bf46030d298ef3b65d'
)

package() {
	cd "${srcdir}/arch-logo"
	rm -fv *~
	mkdir -p "${pkgdir}/usr/share/plymouth/themes/arch-logo"
	install -Dvm644 * "${pkgdir}/usr/share/plymouth/themes/arch-logo"
}
