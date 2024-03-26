# Maintainer: Claudio Nave <claudio nave nine seven at gmail dot com>

pkgname=gnome-shell-extension-no-overview
pkgver=46
pkgrel=1
pkgdesc='Disable the start up overview in Gnome 45+'
arch=('any')
url='https://github.com/fthx/no-overview'
license=('GPL-3.0-only')
depends=(gnome-shell)
_commit='ee39498381be118c7ce9bf6d3ffd5b43649597ef'
source=("git+https://github.com/fthx/no-overview.git#commit=${_commit}")
sha256sums=('a7c77121c0da9ca51f01814bd8f49ac8770ad16fe1e53631e3caa5c89d637729')

package() {
	cd no-overview
	destdir="${pkgdir}/usr/share/gnome-shell/extensions/no-overview@fthx"
	mkdir -p "${destdir}"
	cp -a metadata.json extension.js "${destdir}"
}
