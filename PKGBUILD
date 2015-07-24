# Contributor: Mark Coolen <mark.coolen@gmail.com>

pkgname=berusky-data
pkgver=1.7
pkgrel=1
pkgdesc="A logic game based on the puzzle game Sokoban - data files"
arch=('any')
url="http://anakreon.cz/?q=node/1"
license=('GPL')

source=("http://www.anakreon.cz/download/$pkgname-$pkgver.tar.gz")

md5sums=('76fb1ca01183b385d21aacdb826dcddf')

package() {
	cd "$srcdir"/"$pkgname"-"$pkgver"
	mkdir -p "$pkgdir"/usr/share/berusky/
	cp -r {GameData,Graphics,Levels} "$pkgdir"/usr/share/berusky
}
