# Maintainer: scan

pkgname=dark-aurora-theme
pkgver=20170411
pkgrel=1
pkgdesc="Dark Aurora Theme GNOME 3.20/3.22/3.24"
arch=('any')
url="https://www.gnome-look.org/p/1172657"
license=('GPL')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("Dark-Aurora-Themes.tar.xz::https://dl.opendesktop.org/api/files/download/id/1491896351/Dark-Aurora-Themes.tar.xz")
sha256sums=('b97aea57a83886ae71ed89251bfe7ef299d7c67899b84a5a5d9ef4ba4b7105a9')

package() {
	install -d ${pkgdir}/usr/share/themes
	cp -r Dark-Aurora-Themes/Dark-Aurora ${pkgdir}/usr/share/themes/Dark-Aurora
	find ${pkgdir} -type f -exec chmod 644 {} \;
	find ${pkgdir} -type d -exec chmod 755 {} \;
}
