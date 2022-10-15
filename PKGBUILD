# Maintainer: Claudio Nave <claudio nave nine seven at gmail dot com>

pkgname=gnome-shell-extension-no-overview
pkgver=12
pkgrel=1
pkgdesc='Disable the start up overview in Gnome 40+'
arch=('any')
url='https://github.com/fthx/no-overview'
license=('GPL3')
depends=(gnome-shell)
_commit=665d0e1298b25654b21e027086896b4bd74560ac
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fthx/no-overview/archive/${_commit}.tar.gz")
sha256sums=('72bf3ce7bd7026744c76f8ed7a8868ca641e181687ff53bbaf640235306cd759')

package() {
	cd no-overview-${_commit}
	destdir="${pkgdir}/usr/share/gnome-shell/extensions/no-overview@fthx"
	mkdir -p "${destdir}"
	cp -a metadata.json extension.js "${destdir}"
}
