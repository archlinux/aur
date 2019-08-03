# Maintainer: Alex <indigo@protonmail.ch>

pkgname=bedstead-fonts
pkgver=1.0
pkgrel=1
pkgdesc="Bedstead is a family of outline fonts based on the characters produced by the Mullard SAA5050 series of Teletext Character Generators."
url="https://bjh21.me.uk/bedstead/"
arch=(any)
license=(custom)
source=("https://bjh21.me.uk/bedstead/bedstead.otf"
	"https://bjh21.me.uk/bedstead/bedstead-extended.otf"
	"https://bjh21.me.uk/bedstead/bedstead-semicondensed.otf"
	"https://bjh21.me.uk/bedstead/bedstead-extracondensed.otf"
	"https://bjh21.me.uk/bedstead/bedstead-ultracondensed.otf")

package() {
	install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
	install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 *.otf
}

md5sums=('5cab98db24ae772915a2f64b17a06e8a'
         '61bb84cf9e41872c1ceeb761e6188dbb'
         '1c6bf1981819d4fc1259cb531b661cd4'
         'e4080c353f1d64ea992907f6bdda7883'
         '61b0921351a769e629fd92d096254c00')
