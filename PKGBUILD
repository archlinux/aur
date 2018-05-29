#Maintainer: Shajil K Joshy <shajilkrazy@gmail.com>
pkgname=fonts-cambay
pkgver=1.85
pkgrel=1
pkgdesc="Open-source unicode font for Devanagari designed to match Cantarell Latin."
url="http://github.com/anexasajoop/cambay"
license=('custom:OFL')
arch=(any)
pre_url="http://raw.githubusercontent.com/anexasajoop/cambay/master/Font%20files/Unhinted"
source=("$pre_url/CambayDevanagari-Bold.ttf"
	"$pre_url/CambayDevanagari-BoldOblique.ttf"
	"$pre_url/CambayDevanagari-Oblique.ttf"
	"$pre_url/CambayDevanagari-Regular.ttf")
md5sums=('06ad2493570463134aed11af63506827'
         'f86876adefdec645b341dd46b6d7fa08'
         'b6c6acc2ce4a12ad0c4a0ab02136d71a'
         'cb217db71fdfebb2d666d8fbd5a6f91d')
package() {
	install -d "$pkgdir/usr/share/fonts/TTF/devanagari"
	install -t "$pkgdir/usr/share/fonts/TTF/devanagari" -m644 *.ttf
}

