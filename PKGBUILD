# Maintainer: scan

pkgname=obsidian-icon-theme
pkgver=1
pkgrel=20170509
pkgdesc="Obsidian Icon Theme"
arch=('any')
url="https://www.gnome-look.org/p/1169579"
source=("${pkgname}.zip::https://github.com/madmaxms/iconpack-obsidian/archive/master.zip")
sha256sums=('fa1cd3aeae833559ee225214107448e8ce36205b74649d056fbba186c6e22b21')

package() {
	install -d ${pkgdir}/usr/share/icons
	cp -r iconpack-obsidian-master/Obsidian-1 ${pkgdir}/usr/share/icons/Obsidian-1
	find ${pkgdir} -type f -exec chmod 644 {} \;
	find ${pkgdir} -type d -exec chmod 755 {} \;
}
