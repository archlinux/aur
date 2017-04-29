# Maintainer: scan

pkgname=dark-aurora-theme
pkgver=20170427
pkgrel=1
pkgdesc="Dark Aurora Theme GNOME 3.20/3.22/3.24"
arch=('any')
url="https://www.gnome-look.org/p/1172657"
license=('GPL')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("Dark-Aurora-Themes.tar.xz::https://dl.opendesktop.org/api/files/download/id/1493367844/Dark-Aurora-Themes.tar.xz")
sha256sums=('754735e7eea86a90bdf5153c004d18a7207a8f01b5fc6b51a05da6e613f6ebeb')

package() {
	install -d ${pkgdir}/usr/share/themes
	cp -r Dark-Aurora-Themes/Dark-Aurora ${pkgdir}/usr/share/themes/Dark-Aurora
	find ${pkgdir} -type f -exec chmod 644 {} \;
	find ${pkgdir} -type d -exec chmod 755 {} \;
}
