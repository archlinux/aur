# Maintainer: scan

pkgname=dark-aurora-theme
pkgver=3.20
pkgrel=20161118
pkgdesc="Dark Aurora Theme GNOME 3.20/3.22"
arch=('any')
url="https://www.gnome-look.org/p/1143475"
license=('GPL')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("Dark-Aurora.tar.xz::https://dl.opendesktop.org/api/files/download/id/1478589581/Dark-Aurora.tar.xz")
sha256sums=('6eb78aa48bbd90c285357d06cd887ae07c0f72aa0162afc6a0771a30b10d8cb3')

package() {
	install -d ${pkgdir}/usr/share/themes
	cp -r Dark-Aurora ${pkgdir}/usr/share/themes/Dark-Aurora
	find ${pkgdir} -type f -exec chmod 644 {} \;
	find ${pkgdir} -type d -exec chmod 755 {} \;
}
