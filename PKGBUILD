# Maintainer: scan

pkgname=obsidian-2-theme
pkgver=20170527
pkgrel=1
pkgdesc="Obsidian 2 Theme GNOME 3.22+"
arch=('any')
url="https://www.gnome-look.org/p/1173113/"
license=('GPL')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("Obsidian-2.tar.gz::https://www.dropbox.com/s/jrxqqryoupi2ps4/Obsidian-2.tar.gz")
sha256sums=('1707094b344be358bd56bd3a24c5e7f310babb6ec7e698bd6d0591e7c6208864')

package() {
	install -d ${pkgdir}/usr/share/themes
	cp -r Obsidian-2 ${pkgdir}/usr/share/themes/Obsidian-2
	find ${pkgdir} -type f -exec chmod 644 {} \;
	find ${pkgdir} -type d -exec chmod 755 {} \;
}
