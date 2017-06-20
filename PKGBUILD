# Maintainer: scan

pkgname=obsidian-icon-theme
pkgver=20170617
pkgrel=1
pkgdesc="Obsidian Icon Theme"
arch=('any')
url="https://www.gnome-look.org/p/1169579"
license=('GPL')
_git_sha=f7a9dce7a5b06ca326577ae9342a5b3591f4f222
source=("https://github.com/madmaxms/iconpack-obsidian/archive/$_git_sha.tar.gz")
sha256sums=('059c58b4020d8fddd6f958d96628059a5b2c6aebc3eb61830f9027381fe33a6b')

package() {
	install -d ${pkgdir}/usr/share/icons
	cp -r ${srcdir}/iconpack-obsidian-$_git_sha/Obsidian ${pkgdir}/usr/share/icons/Obsidian
	cp -r ${srcdir}/iconpack-obsidian-$_git_sha/Obsidian_gray ${pkgdir}/usr/share/icons/Obsidian_gray
	cp -r ${srcdir}/iconpack-obsidian-$_git_sha/Obsidian_green ${pkgdir}/usr/share/icons/Obsidian_green
	find ${pkgdir} -type f -exec chmod 644 {} \;
	find ${pkgdir} -type d -exec chmod 755 {} \;
}
