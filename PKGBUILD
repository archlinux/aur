pkgname=narcissu2
pkgver=600392_steam+v1.1	# https://steamdb.info/app/264380/patchnotes/
pkgrel=1
pkgdesc="A free japanese visual novel game, translated into English. This package includes both Narcissu and Narcissu: Side 2nd."
arch=(any)
url=https://www.neechin.net/narcissu/
license=(custom:freeware)
depends=(ponscripter)
source=(
	https://archive.org/download/narcissu2/{narcissu2,arc1}.7z
	https://www.neechin.net/file_download/27/Narcissu_2_Eng_v1.1_script_[All_platforms].zip
	https://github.com/07th-mod/ponscripter-fork/raw/mod/src/resources/narci2.{ico,png}
	narcissu2{,-v1.1}.desktop)
md5sums=(
	b8032dd59633ce10f13321489b73da1a
	a0b15677ba3f723f642bce5c9b2d8073
	cbbdf90489e0b937454e4ed94d63824a
	571d83dfa4b39c0ba95f825810104243
	50dbdaba66b5ad8837fd364610e72822
	1025f541365a46e46899000fdd70f21f
	ad2395812e541c546ac93e7bc418d8ba)
package(){
	mkdir -p "$pkgdir"/usr/share/narcissu2/v1.1
	cp -r narcissu2 "$pkgdir"/usr/share
	cp -r arc1/* 0.utf "$pkgdir"/usr/share/narcissu2/v1.1
	cp {narci2,"$pkgdir"/usr/share/narcissu2/icon}.png
	ln -s ../icon.png "$pkgdir"/usr/share/narcissu2/v1.1
	install narci2.ico -Dt "$pkgdir"/usr/share/pixmaps
	install narcissu2{,-v1.1}.desktop -Dt "$pkgdir"/usr/share/applications
}
