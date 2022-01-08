# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-farlands-reloaded
_pkgname=farlands_reloaded
_pkgauthor=wsor4035
pkgver=2022.01.03
_cdbrel=10416
pkgrel=1
pkgdesc="a game" # tfw
license=("MIT")
sha256sums=('89de91e9a26f2d9199f218afc24287b990594eda5e9829716dce90ac45900c58')

arch=("any")
url="https://content.minetest.net/packages/${_pkgauthor}/${_pkgname}/"
depends=("minetest-common")
source=("${_pkgname}-${pkgver}.zip::https://content.minetest.net/packages/${_pkgauthor}/${_pkgname}/releases/${_cdbrel}/download/")
options=(!strip)
noextract=("${_pkgname}-${pkgver}.zip")

package() {
	install -d "${pkgdir}/usr/share/minetest/games/"
	unzip "${_pkgname}-${pkgver}.zip" -d "${pkgdir}/usr/share/minetest/games/"
}
