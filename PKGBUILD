# Maintainer Sean Anderson <seanga2@gmail.com>
pkgname=mse-mtg-m15-highres
pkgver=1.0
pkgrel=1
pkgdesc="300 dpi Magic: the Gathering templates for Magic Set Editor."
arch=(any)
url="https://old.reddit.com/r/mpcproxies/comments/budzyg/mpcformatted_magic_set_editor_template/"
license=('freeware')
depends=('magicseteditor')
conflicts=("mse-mtg-phyrexian" "magicseteditor-mtg-base")
source=('https://dancing-electron.netlify.com/magic-m15-altered.zip'
	'https://dancing-electron.netlify.com/magic-m15-mainframe-planeswalker.zip'
	'https://dancing-electron.netlify.com/magic-m15-mainframe-dfc.zip'
	'https://dancing-electron.netlify.com/magic-m15-leveler-improved.zip'
	'https://dancing-electron.netlify.com/magic-m15-fullart-lands.zip')
md5sums=('8bff117776beb56396708404de8e6c36'
	'0e8d1dd595ea503c19edc66200f4584b'
	'c86878c19d727f1a02c9518b7b04dc73'
	'5f061030b6d55d9bd822324bbc0c2032'
	'0e541d3d804bdb61783ba4a7ebded05c')

package() {
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/magicseteditor/data"
	
	cp -r ./magic-m15-{altered,fullart-lands,leveler-improved,mainframe-dfc,mainframe-planeswalker}.mse-style "$pkgdir/usr/share/magicseteditor/data"
}

# vim:set ts=2 sw=2
