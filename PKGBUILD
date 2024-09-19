# Maintainer: EvaristeGalois11 <turbo dot backslid four zero zero at passinbox dot com>

pkgname=gnome-shell-extension-no-overview
pkgver=47
pkgrel=1
pkgdesc='Disable the start up overview in Gnome 40+'
arch=('any')
url='https://github.com/fthx/no-overview'
license=('GPL-3.0-only')
depends=(gnome-shell)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fthx/no-overview/archive/v${pkgver}.tar.gz")
sha256sums=('3a97f263d71264285a7aabed706a0d103e2f1596f57a4b8cc59a766c372097ec')

package() {
	cd no-overview-${pkgver}
	destdir="${pkgdir}/usr/share/gnome-shell/extensions/no-overview@fthx"
	mkdir -p "${destdir}"
	cp -a metadata.json extension.js "${destdir}"
}
