pkgname=narcissu2-en
pkgver=600392_steam	# https://steamdb.info/app/264380/patchnotes/
pkgrel=1
pkgdesc="A free japanese visual novel game, translated into English. This package includes both Narcissu and Narcissu: Side 2nd."
arch=(any)
url=https://www.neechin.net/narcissu/
license=(custom:freeware)
depends=(ponscripter)
source=(
	https://archive.org/download/narcissu2/narcissu2.7z
	https://github.com/07th-mod/ponscripter-fork/raw/mod/src/resources/narci2.{ico,png}
	narcissu2.desktop)
md5sums=(
	b8032dd59633ce10f13321489b73da1a
	571d83dfa4b39c0ba95f825810104243
	50dbdaba66b5ad8837fd364610e72822
	e86538eae0bc9618729beb46321b9374)
package(){
	install -D {narci2,"$pkgdir"/usr/share/narcissu2/icon}.png
	cp -r narcissu2 "$pkgdir"/usr/share
	install narci2.ico -Dt "$pkgdir"/usr/share/pixmaps
	install narcissu2.desktop -Dt "$pkgdir"/usr/share/applications
}
