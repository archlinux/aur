# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-infinite-ikea
_pkgname=ikea
_pkgauthor=benrob0329
pkgver=0.0.4
_cdbrel=8184
pkgrel=1
pkgdesc="Survival horror game based on SCP-3008."
license=("MIT")
sha256sums=('809152f2009c13803ad968096e2814c0f0d495ffd8439985e9e7acce7aa2b4d6')

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
