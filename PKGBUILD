# Maintainer: scan

pkgname=dark-aurora-theme
pkgver=3.20
pkgrel=1
pkgdesc="Dark Aurora Theme GNOME 3.20/3.22"
arch=('any')
url="https://www.gnome-look.org/p/1143475"
license=('GPL')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("https://dl.opendesktop.org/api/files/download/id/1475127475/Dark-Aurora.tar.xz")
sha256sums=('76485af47a48aec32a436403fd1f37b6e5fba5199e60b9d37566ff0d98335206')

package() {
	install -d ${pkgdir}/usr/share/themes
	cp -r Dark-Aurora ${pkgdir}/usr/share/themes/Dark-Aurora
	find ${pkgdir} -type f -exec chmod 644 {} \;
	find ${pkgdir} -type d -exec chmod 755 {} \;
}
