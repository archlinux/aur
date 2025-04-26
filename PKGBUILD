# Contributor: ROllerozxa <temporaryemail4meh [gee mail]>
pkgname=minetest-arcade3d
_pkgname=pacman
_pkgauthor=Thunder1035
pkgver=2022.08.16
_cdbrel=13328
pkgrel=2
pkgdesc="A Pacman inspired game"
license=("GPLv3")
sha256sums=('86c9deac0a94f2f670594d0beb065366c311763878dc7ef4f26bda6bdd0686b8')

arch=("any")
url="https://content.minetest.net/packages/${_pkgauthor}/${_pkgname}/"
depends=("minetest-common")
source=("https://content.luanti.org/uploads/026374c772.zip")
options=(!strip)

package() {
	install -d "${pkgdir}/usr/share/minetest/games/"
	mv ${_pkgname} "${pkgdir}/usr/share/minetest/games/"
}
