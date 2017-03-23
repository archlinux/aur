# Maintainer: scan

pkgname=obsidian-2-theme
pkgver=3.22
pkgrel=20170320
pkgdesc="Obsidian 2 Theme GNOME 3.22+"
arch=('any')
url="https://www.gnome-look.org/p/1173113/"
license=('GPL')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("Obsidian-2.zip::https://dl.opendesktop.org/api/files/download/id/1490050871/theme-obsidian-2-blue.zip")
sha256sums=('cce02795afcd9b0effdad9e353e4b7e7f063330a7298ed7ff5e686dcc39e67b4')

package() {
	install -d ${pkgdir}/usr/share/themes
	cp -r Obsidian-2 ${pkgdir}/usr/share/themes/Obsidian-2
	find ${pkgdir} -type f -exec chmod 644 {} \;
	find ${pkgdir} -type d -exec chmod 755 {} \;
}
