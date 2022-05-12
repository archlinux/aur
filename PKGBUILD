# Maintainer: Claudio Nave <claudio nave nine seven at gmail dot com>

pkgname=gnome-shell-extension-no-overview
pkgver=11.0
pkgrel=2
pkgdesc='Disable the start up overview in Gnome 40'
arch=('any')
url='https://github.com/fthx/no-overview'
license=('GPL3')
depends=(gnome-shell)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fthx/no-overview/archive/refs/tags/v11.tar.gz")
sha256sums=('1baa0aca882d355f86440869e9a88bc8708319f12f2b25fa8e0f752ba53195e3')

package() {
	cd no-overview-11
	destdir="${pkgdir}/usr/share/gnome-shell/extensions/no-overview@fthx"
	mkdir -p "${destdir}"
	cp -a metadata.json extension.js "${destdir}"
}
