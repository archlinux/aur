# Maintainer: Alex <indigo@protonmail.ch>

pkgname=bedstead-fonts
pkgver=1.0
pkgrel=3
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

md5sums=('8f470fe3177d0ade14a5e464a08c365d'
         'e180a7de8a79427bf42aebf78313a1e1'
         '8a614f589a87e8c1b2bb09a53316692c'
         '3d7ea90575c0d611f40bb37f528e4032'
         '9c7f71fce912257e3fa1e822e5099421')
