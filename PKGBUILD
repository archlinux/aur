# Contributor: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-alter
pkgver=2024.02.07
pkgrel=1
pkgdesc="A challenging puzzle game in a dystopian future"
license=("AGPL-3.0-or-later" )
sha256sums=('d72e4f6684772bedc5c9f3e8a3ade444e5cc1a9089c15324a7758166878f12bd')

arch=("any")
url="https://content.minetest.net/packages/yaman/alter/"
depends=("minetest-common")
source=("https://content.luanti.org/uploads/d6df9e43b5.zip")
options=(!strip)
package() {
	install -d "${pkgdir}/usr/share/minetest/games/"
	mv alter "${pkgdir}/usr/share/minetest/games/"
}
