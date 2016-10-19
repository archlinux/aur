# Maintainer: scan

pkgname=dark-aurora-theme
pkgver=3.20
pkgrel=20161005
pkgdesc="Dark Aurora Theme GNOME 3.20/3.22"
arch=('any')
url="https://www.gnome-look.org/p/1143475"
license=('GPL')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("https://dl.opendesktop.org/api/files/download/id/1475645078/Dark-Aurora.tar.xz")
sha256sums=('72c9b247041eb6b42e6acfcf6dabbcd6d0ec29373ccbf8c29bb0ecd95c6bddda')

package() {
	install -d ${pkgdir}/usr/share/themes
	cp -r Dark-Aurora ${pkgdir}/usr/share/themes/Dark-Aurora
	find ${pkgdir} -type f -exec chmod 644 {} \;
	find ${pkgdir} -type d -exec chmod 755 {} \;
}
