# Maintainer: EvaristeGalois11 <turbo dot backslid four zero zero at passinbox dot com>

pkgname=gnome-shell-extension-no-overview
pkgver=48
pkgrel=1
pkgdesc='Disable the start up overview in Gnome 40+'
arch=('any')
url='https://github.com/fthx/no-overview'
license=('GPL-3.0-only')
depends=(gnome-shell)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fthx/no-overview/archive/v${pkgver}.tar.gz")
sha256sums=('d48d12d91f30d90b49bcf6342d1891b2b1871e321d68e1457b7205d3adbdcb8b')

package() {
	cd no-overview-${pkgver}
	destdir="${pkgdir}/usr/share/gnome-shell/extensions/no-overview@fthx"
	mkdir -p "${destdir}"
	cp -a metadata.json extension.js "${destdir}"
}
