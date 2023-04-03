# Maintainer: Claudio Nave <claudio nave nine seven at gmail dot com>

pkgname=gnome-shell-extension-no-overview
pkgver=44
pkgrel=1
pkgdesc='Disable the start up overview in Gnome 40+'
arch=('any')
url='https://github.com/fthx/no-overview'
license=('GPL3')
depends=(gnome-shell)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fthx/no-overview/archive/v${pkgver}.tar.gz")
sha256sums=('7c381f4645657d7bf09160e3f094273162d2f53883701e24c072d1d48f3ca9a2')

package() {
	cd no-overview-${pkgver}
	destdir="${pkgdir}/usr/share/gnome-shell/extensions/no-overview@fthx"
	mkdir -p "${destdir}"
	cp -a metadata.json extension.js "${destdir}"
}
