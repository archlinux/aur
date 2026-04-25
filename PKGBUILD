# Maintainer: Mike Pento <mjpento@gmail.com>

pkgname=eterm-themes
pkgver=0.9.6
pkgrel=3
pkgdesc="Themes for Eterm, the Enlightened terminal emulator."
arch=('any')
url="https://github.com/mikepento/eterm-themes"
license=('AGPL-3.0-or-later')
depends=('eterm')
options+=('!debug')
source=(https://github.com/mikepento/eterm-themes/archive/refs/tags/v${pkgver}-${pkgrel}.tar.gz)
md5sums=('5aec6b19cba98ebf1e65e55fcb11f567')

package() {
	cd ${srcdir}/${pkgname}-${pkgver}-${pkgrel}

	mkdir -p ${pkgdir}/usr/share/Eterm/themes

	cp -r themes/* ${pkgdir}/usr/share/Eterm/themes/
}

