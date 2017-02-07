# Maintainer: scan

pkgname=dark-aurora-theme
pkgver=3.20_3.22
pkgrel=20170207
pkgdesc="Dark Aurora Theme GNOME 3.20/3.22"
arch=('any')
url="https://www.gnome-look.org/p/1143475"
license=('GPL')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("Dark-Aurora.tar.xz::http://orig07.deviantart.net/dbf1/f/2017/037/0/c/dark_aurora_3_20_by_bolimage66-da5f2gf.zip")
sha256sums=('eb040434d2e38cb27d8e46579b20b2428591ecb0eead01d846177d821b594d05')

package() {
	install -d ${pkgdir}/usr/share/themes
	cp -r Dark-Aurora ${pkgdir}/usr/share/themes/Dark-Aurora
	find ${pkgdir} -type f -exec chmod 644 {} \;
	find ${pkgdir} -type d -exec chmod 755 {} \;
}
