# Maintainer: scan

pkgname=obsidian-icon-theme
pkgver=1
pkgrel=20170226
pkgdesc="Obsidian Icon Theme"
arch=('any')
url="https://www.gnome-look.org/p/1169579"
source=("${pkgname}.zip::https://dl.opendesktop.org/api/files/download/id/1487706739/1487706739-obsidian-1-iconpack.zip")
sha256sums=('f8b25ef874e0092a78467dab5a8c2655feee0e4ddd7c603c861765e2f5c8d034')

package() {
	install -d ${pkgdir}/usr/share/icons
	cp -r Obsidian-1 ${pkgdir}/usr/share/icons/Obsidian-1
	find ${pkgdir} -type f -exec chmod 644 {} \;
	find ${pkgdir} -type d -exec chmod 755 {} \;
}
