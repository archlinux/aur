# Maintainer: scan

pkgname=dark-aurora-theme
pkgver=3.20_3.22
pkgrel=20161121
pkgdesc="Dark Aurora Theme GNOME 3.20/3.22"
arch=('any')
url="https://www.gnome-look.org/p/1143475"
license=('GPL')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("Dark-Aurora.tar.xz::https://dl.opendesktop.org/api/files/download/id/1479719547/Dark-Aurora.tar.xz")
sha256sums=('3259a8be44493ab5f3b2b455b6dae7725e0646b160c2b9a83968bf81feb3eaaa')

package() {
	install -d ${pkgdir}/usr/share/themes
	cp -r Dark-Aurora ${pkgdir}/usr/share/themes/Dark-Aurora
	find ${pkgdir} -type f -exec chmod 644 {} \;
	find ${pkgdir} -type d -exec chmod 755 {} \;
}
