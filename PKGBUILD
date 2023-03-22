# Maintainer: Claudio Nave <claudio nave nine seven at gmail dot com>

pkgname=gnome-shell-extension-no-overview
pkgver=13
pkgrel=1
pkgdesc='Disable the start up overview in Gnome 40+'
arch=('any')
url='https://github.com/fthx/no-overview'
license=('GPL3')
depends=(gnome-shell)
_commit=68db01d25f93d3634c49fd2b411b899bdf3978b8
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fthx/no-overview/archive/${_commit}.tar.gz")
sha256sums=('3fefa1c76ee915511b889de3a72e40ca9d2723f0e8928befd6e0e4f4a7950bb2')

package() {
	cd no-overview-${_commit}
	destdir="${pkgdir}/usr/share/gnome-shell/extensions/no-overview@fthx"
	mkdir -p "${destdir}"
	cp -a metadata.json extension.js "${destdir}"
}
