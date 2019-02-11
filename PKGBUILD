# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>
pkgname=gruvbox-icon-theme
pkgver=1.0
pkgrel=4
pkgdesc="A gruvboxed icon theme"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2')
source=("https://github.com/cyrinux/gruvbox-icon-theme/archive/master.zip")
md5sums=('3e094a72d75d498855c7ebd4bc86c4a0')

package() {
	cd ${srcdir}/
	mkdir -p ${pkgdir}/usr/share/icons
	cp -r gruvbox-icon-theme-master ${pkgdir}/usr/share/icons/Gruvbox
	chown -R root:root ${pkgdir}/usr/share/icons
	chmod -R ugo+rX ${pkgdir}/usr/share/icons
}
