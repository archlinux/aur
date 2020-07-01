# Maintainer: Alex <indigo@protonmail.ch>

pkgname=bedstead-fonts
pkgver=1.0
pkgrel=2
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

md5sums=('15ca003818995bc4a9644bb294fc1733'
         '26da580e65466c7d584365826587241d'
         '112d481df0467030723ade2b08ea8e0b'
         '3a71328d5c89a6bb961e073f977a41ea'
         'eca3e19a6b193adb49c9b553aac0fd64')
