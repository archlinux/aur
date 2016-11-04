# Maintainer: scan

pkgname=dark-aurora-theme
pkgver=3.20
pkgrel=20161104
pkgdesc="Dark Aurora Theme GNOME 3.20/3.22"
arch=('any')
url="https://www.gnome-look.org/p/1143475"
license=('GPL')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("Dark-Aurora.tar.xz::https://dl.opendesktop.org/api/files/download/id/1478255458/Dark-Aurora.tar.xz")
sha256sums=('a95e1232c41987b01f435b0c929eced0041b13e8d3754133553b534cf6ac8252')

package() {
	install -d ${pkgdir}/usr/share/themes
	cp -r Dark-Aurora ${pkgdir}/usr/share/themes/Dark-Aurora
	find ${pkgdir} -type f -exec chmod 644 {} \;
	find ${pkgdir} -type d -exec chmod 755 {} \;
}
