# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Manuel Hüsers <aur@huesers.de>
# Contributor: Guillermo Garcia <ahioros@NO-SPAM.gmail.com>

pkgname=plymouth-theme-arch-logo
pkgver=1
pkgrel=2
pkgdesc='A remake of the ubuntu-logo Plymouth theme, based on the debian-logo theme, but featuring the Arch Linux logo.'
arch=('any')
# Alternative website(s)
#url='http://karlinux.deviantart.com/art/Arch-Logo-Plymouth-Theme-209553250'
url='https://www.gnome-look.org/content/show.php/Arch-logo+plymouth?content=141697'
license=('GPL-3.0-or-later')
depends=('plymouth')
install="${pkgname}.install"
source=(
	'plymouth-theme-arch-logo.tar.gz'
)
sha512sums=('0c834bccc32d8d2df1a0bf2ae859487eef273ddf8047a7444f3630dffbbf04a9d014242304c5b2bcd9172bea2e04195f329dfe1fe4661bcc5af29ca64104af06')

package() {
	cd "${srcdir}/arch-logo"
	rm -fv *~
	mkdir -p "${pkgdir}/usr/share/plymouth/themes/arch-logo"
	install -Dvm644 * "${pkgdir}/usr/share/plymouth/themes/arch-logo"
}
