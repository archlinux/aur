pkgname=zlodej
pkgver=1.7E+patch
pkgrel=1
pkgdesc='Zloděj (The Clue!)'
arch=(any)
url=https://sourceforge.net/projects/cosp/
license=(unknown)
depends=(derclou)
install=zlodej.install
source=(https://download.sf.net/cosp/Original%20Game%20Files/The%20Clue%21%20%28Czech%29/ClueCZ.zip)
noextract=(ClueCZ.zip)
md5sums=(18966a76e3911db6e185be77aba925b3)
package(){
	install -dm757 "$pkgdir"/usr/share/zlodej/DATADISK
	bsdtar xf ClueCZ.zip -C"$pkgdir"/usr/share/zlodej DATA{,DISK} INTROPIX PICTURES SAMPLES SOUNDS TEXTS
	rm "$pkgdir"/usr/share/zlodej/DATADISK/GAMES.LST	# zachovej po odstranění balíčku
}
