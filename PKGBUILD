# Maintainer: scan

pkgname=gnome-shell-theme-dark-mode
pkgver=3.18
pkgrel=1
pkgdesc="Dark Mode GNOME Shell theme for GNOME 3.18"
arch=('any')
url="http://gnome-look.org/content/show.php/Dark+Mode?content=166387"
license=('GPL3')
depends=('gnome-shell')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("darkmode.zip::http://gnome-look.org/CONTENT/content-files/166387-Dark%20Mode-3.18.zip")
md5sums=('501c96ceee3c4e50ffef46fd6f7b7509')

package() {
	install -d ${pkgdir}/usr/share/themes
	cp -r Dark\ Mode ${pkgdir}/usr/share/themes/DarkMode
	find ${pkgdir} -type f -exec chmod 644 {} \;
	find ${pkgdir} -type d -exec chmod 755 {} \;
}
