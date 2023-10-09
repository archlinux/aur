# Maintainer: Claudio Nave <claudio nave nine seven at gmail dot com>

pkgname=gnome-shell-extension-no-overview
pkgver=45
pkgrel=1
pkgdesc='Disable the start up overview in Gnome 45+'
arch=('any')
url='https://github.com/fthx/no-overview'
license=('GPL3')
depends=(gnome-shell)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fthx/no-overview/archive/v${pkgver}.tar.gz")
sha256sums=('852af6bd281340c68dbc86f6825d43553b543825450d9eaecc49765a94cc47d6')

package() {
	cd no-overview-${pkgver}
	destdir="${pkgdir}/usr/share/gnome-shell/extensions/no-overview@fthx"
	mkdir -p "${destdir}"
	cp -a metadata.json extension.js "${destdir}"
}
