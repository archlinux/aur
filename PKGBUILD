# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-luckydude
_pkgname=luckydude
_pkgauthor=xenonca
pkgver=1.3
_cdbrel=10139
pkgrel=1
pkgdesc="Can you guess which cube to hit last?"
license=("LGPLv2.1")
sha256sums=('2382fec964b96069daf84ec9828d864abdcc6a17e1b0f6a5b38236c9f50ce0bc')

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
