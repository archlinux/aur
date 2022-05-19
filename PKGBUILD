# Maintainer: Alex <indigo@protonmail.ch>

pkgname=bedstead-fonts
pkgver=1.0
pkgrel=4
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

sha256sums=('f7d195d5faf04b4c6dbbf2812d76e2ce8f6d73b88759d4e8531e764db7ea26a3'
            '3917d986972768f4c1ece841e918146db1549966b25ccc7da0d52d413ac1513c'
            'e191e4fe0a5a82e8f5ed08b70d007c71631914cf337186721885c09c603dea40'
            '08cd505031fdda72d4bcdcebe7860edd566b10333217b50b91bfa9a73a4c9f1d'
            'afc29c1ed877e928458c71a74ed4d5dac17ce3e401d120d0619259cc95e59a29')
