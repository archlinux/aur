# Maintainer: scan

pkgname=obsidian-icon-theme
pkgver=1
pkgrel=20170414
pkgdesc="Obsidian Icon Theme"
arch=('any')
url="https://www.gnome-look.org/p/1169579"
source=("${pkgname}.zip::https://dl.opendesktop.org/api/files/download/id/1492134008/obsidian-1-iconpack.zip")
sha256sums=('a126f2cdbf197e95232e3f41243c77dfd297f0a8014980ad7a7f816eb117ed74')

package() {
	install -d ${pkgdir}/usr/share/icons
	cp -r Obsidian-1 ${pkgdir}/usr/share/icons/Obsidian-1
	find ${pkgdir} -type f -exec chmod 644 {} \;
	find ${pkgdir} -type d -exec chmod 755 {} \;
}
