# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-hades-revisited
_pkgname=hades_revisited
_pkgauthor=Wuzzy
pkgver=0.15.3
_cdbrel=18198
pkgrel=1
pkgdesc="Use your limited supplies to survive and use terraforming to create a beautiful habitable place."
license=("LGPL2.1")
sha256sums=('b70432935ef48d39f14652a35f493674f42e4617ccb23bf7d8517181dfae3d8a')

arch=("any")
url="https://content.minetest.net/packages/${_pkgauthor}/${_pkgname}/"
depends=("minetest-common")
makedepends=("unzip")
source=("${_pkgname}-${pkgver}.zip::https://content.minetest.net/packages/${_pkgauthor}/${_pkgname}/releases/${_cdbrel}/download/")
options=(!strip)
noextract=("${_pkgname}-${pkgver}.zip")

package() {
	install -d "${pkgdir}/usr/share/minetest/games/"
	unzip "${_pkgname}-${pkgver}.zip" -d "${pkgdir}/usr/share/minetest/games/"
}
