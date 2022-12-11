pkgname=narcissu2-en
pkgver=1.1
pkgrel=9
pkgdesc="A free japanese visual novel game, translated into English. This package includes both Narcissu and Narcissu: Side 2nd."
arch=(any)
url=https://www.neechin.net/narcissu/
license=(custom:freeware)
depends=(ponscripter)
source=(
	https://www.neechin.net/file_download/2{2/[Denpa]_Narcissu_2_Eng_[unix].tar.bz2,7/Narcissu_2_Eng_v1.1_script_[All_platforms].zip}
	https://github.com/07th-mod/ponscripter-fork/raw/mod/src/resources/narci2.{ico,png}
	$pkgname.desktop)
md5sums=(
	e785f7bb8735867b130c78dd17da3a5f
	cbbdf90489e0b937454e4ed94d63824a
	571d83dfa4b39c0ba95f825810104243
	50dbdaba66b5ad8837fd364610e72822
	28740061cebcef220e37bd2f384299e4)
package(){
	install narcissu2-installer/data/*.{nsa,bmp,mpg} 0.utf -Dt "$pkgdir"/usr/share/$pkgname
	cp {narci2,"$pkgdir"/usr/share/$pkgname/icon}.png
	install narcissu2-installer/README -Dt "$pkgdir"/usr/share/doc/$pkgname
	cp README.txt "$pkgdir"/usr/share/doc/$pkgname/README_v1.1
	install narci2.ico -Dt "$pkgdir"/usr/share/pixmaps
	install $pkgname.desktop -Dt "$pkgdir"/usr/share/applications
}
