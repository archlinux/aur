# Maintainer: scan

pkgname=dark-aurora-theme
pkgver=3.20_3.22
pkgrel=20161213
pkgdesc="Dark Aurora Theme GNOME 3.20/3.22"
arch=('any')
url="https://www.gnome-look.org/p/1143475"
license=('GPL')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("Dark-Aurora.tar.xz::https://dl.opendesktop.org/api/files/download/id/1481617804/Dark-Aurora.tar.xz")
sha256sums=('280c27f22ac43a5c08148935d09826092c3c106b72a3f1c863b074563683f560')

package() {
	install -d ${pkgdir}/usr/share/themes
	cp -r Dark-Aurora ${pkgdir}/usr/share/themes/Dark-Aurora
	find ${pkgdir} -type f -exec chmod 644 {} \;
	find ${pkgdir} -type d -exec chmod 755 {} \;
}
