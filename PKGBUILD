# Maintainer: EvaristeGalois11 <turbo dot backslid four zero zero at passinbox dot com>

pkgname=gnome-shell-extension-no-overview
pkgver=49
pkgrel=1
epoch=1
pkgdesc='Disable the start up overview in Gnome 40+'
arch=('any')
url='https://github.com/fthx/no-overview'
license=('GPL-3.0-only')
depends=(gnome-shell)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fthx/no-overview/archive/v${pkgver}.tar.gz")
sha256sums=('b952cb803a1c34ad9473d394b920442cab7fc66631cfea10c103c7173e96853d')

package() {
	cd no-overview-${pkgver}
	destdir="${pkgdir}/usr/share/gnome-shell/extensions/no-overview@fthx"
	mkdir -p "${destdir}"
	cp -a metadata.json extension.js "${destdir}"
}
