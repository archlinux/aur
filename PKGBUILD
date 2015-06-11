# Contributor: Georgij Kondratjev <smpuj@bk.ru>
pkgname=ttf-jgaramond
pkgver=20010820
pkgrel=1
pkgdesc="Free Garamond-based TrueType font"
arch=("i686" "x86_64")
url="http://www.janthor.com/jGaramond/"
license=("custom")
depends=()
makedepends=("unzip")
source=("http://www.janthor.com/jGaramond/jGara.zip")
md5sums=('dcfa9f2ca0772e47a378026f02306c99')

build() {
	install -d $startdir/pkg/usr/share/fonts/TTF
	install -m644 *.ttf $startdir/pkg/usr/share/fonts/TTF
	install -Dm644 jGaramd2.txt $startdir/pkg/usr/share/licenses/$pkgname/$pkgname.txt
}
# vim: ts=2 
