# Maintainer	: Pablo Lezaeta <prflr88 (arro'a) gmail puntocom>
# Contributor	: StarGater93 <stargater93@gmail.com>

pkgbase=celestia-medium-redux
pkgname=(ttf-celestia-medium-redux t1-celestia-medium-redux)
_realname=CelestiaMediumRedux
pkgver=1.55
pkgrel=1
pkgdesc="A font collection based off on Generation B (used in My Little Pony: Friendship is MAgic), originally created by Purple Tinker, redux by Mattyhex"
arch=("any")
url="http://www.mattyhex.net/CMR/"
depends=('xorg-fonts-alias' 'xorg-fonts-encodings')
license=('custom:Public Domain')
source=("${url}media/fonts/${_realname}${pkgver}.ttf"
        "${url}media/fonts/${_realname}_alt${pkgver}.ttf"
        "${url}media/fonts/${_realname}PostScript${pkgver}.zip")
md5sums=('363a277c00badde21964523184d3c1c4'
	'42b203c5113594b9e5f0589269f3f8d3'
	'8b7b2d909f30569a8fb51d1883c223e8')

package_ttf-celestia-medium-redux() {
	pkgname=ttf-celestia-medium-redux
	pkgdesc="A TTF font based off on Generation B (used in My Little Pony: Friendship is Magic), originally created by Purple Tinker, redux by Mattyhex"
	provides=("ttf-celestia")
	replaces=("ttf-celestia")
	depends=('fontconfig' 'xorg-font-utils')
	
	mkdir -p "$pkgdir/usr/share/fonts/TTF"
	cp "$srcdir/"*.ttf "$pkgdir/usr/share/fonts/TTF"
}

package_t1-celestia-medium-redux() {
	pkgname=t1-celestia-medium-redux
	pkgdesc="A PostScript font based off on Generation B (used in My Little Pony: Friendship is Magic), originally created by Purple Tinker, redux by Mattyhex"
        provides=("t1-celestia")
        replaces=("t1-celestia")
	depends=('xorg-fonts-encodings' 'xorg-fonts-alias' 'xorg-font-utils' 'fontconfig')

	mkdir -p "$pkgdir/usr/share/fonts/Type1"
	cp "$srcdir/"*.ps "$pkgdir/usr/share/fonts/Type1"
	cp "$srcdir/"*.afm "$pkgdir/usr/share/fonts/Type1"
}
