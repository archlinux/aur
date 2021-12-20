# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-infinite-ikea
_pkgname=ikea
_pkgauthor=benrob0329
pkgver=0.0.5
_cdbrel=10088
pkgrel=1
pkgdesc="Survival horror game based on SCP-3008."
license=("MIT")
sha256sums=('2fe64cf96bf2a68bac8d4ea682e37b857c431fb39a4afc94e77ee279fda5a291')

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
