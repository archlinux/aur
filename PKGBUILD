# Maintainer: Claudio Nave <claudio nave nine seven at gmail dot com>

pkgname=gnome-shell-extension-no-overview
pkgver=8.r2.02f074f
pkgrel=1
pkgdesc='Disable the start up overview in Gnome 40'
arch=('any')
url='https://github.com/fthx/no-overview'
license=('GPL3')
depends=(gnome-shell-extensions)
_commit=02f074ffc048e45a0ebbf232bd154e9a754adfcb
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fthx/no-overview/archive/${_commit}.tar.gz")
sha512sums=('cacc6bbc5c3fff02155b980431f3b5f4ac7f632039f1e2dffe004cc283e533239810004562fc0c77f7d794b685fda1cabe91e61503a866ee3d38d176729007a9')

package() {
	cd no-overview-${_commit}
	destdir="${pkgdir}/usr/share/gnome-shell/extensions/no-overview@fthx"
	mkdir -p "${destdir}"
	cp -a metadata.json extension.js "${destdir}"
}
