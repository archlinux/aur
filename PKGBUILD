# Maintainer: scan

pkgname=dark-aurora-theme
pkgver=3.20_3.22
pkgrel=20170321
pkgdesc="Dark Aurora Theme GNOME 3.20/3.22"
arch=('any')
url="https://www.gnome-look.org/p/1143475"
license=('GPL')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("Dark-Aurora.tar.xz::http://orig09.deviantart.net/f3d5/f/2017/078/4/c/dark_aurora_3_20_by_bolimage66-da5f2gf.zip")
sha256sums=('dcd077ae275ef0d54d9774a6414e690197f1e867cdb458232524f68924323b13')

package() {
	install -d ${pkgdir}/usr/share/themes
	cp -r Dark-Aurora-3.20/Dark-Aurora ${pkgdir}/usr/share/themes/Dark-Aurora
	find ${pkgdir} -type f -exec chmod 644 {} \;
	find ${pkgdir} -type d -exec chmod 755 {} \;
}
