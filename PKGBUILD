# Maintainer: scan

pkgname=dark-aurora-theme
pkgver=3.20_3.22
pkgrel=20161124
pkgdesc="Dark Aurora Theme GNOME 3.20/3.22"
arch=('any')
url="https://www.gnome-look.org/p/1143475"
license=('GPL')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("Dark-Aurora.tar.xz::https://dl.opendesktop.org/api/files/download/id/1480011363/Dark-Aurora.tar.xz")
sha256sums=('d3519771c19547a26a062fcc5a8624893fbecdda6846a68acea5b0cd0b4a318e')

package() {
	install -d ${pkgdir}/usr/share/themes
	cp -r Dark-Aurora ${pkgdir}/usr/share/themes/Dark-Aurora
	find ${pkgdir} -type f -exec chmod 644 {} \;
	find ${pkgdir} -type d -exec chmod 755 {} \;
}
