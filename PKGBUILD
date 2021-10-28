#Maintainer: Shajil K Joshy <shajilkrazy@gmail.com>
pkgname=fonts-cambay
pkgver=1.85
pkgrel=2
pkgdesc="Open-source unicode font for Devanagari designed to match Cantarell Latin."
url="http://github.com/anexasajoop/cambay"
license=('custom:OFL')
arch=(any)
pre_url="http://raw.githubusercontent.com/anexasajoop/cambay/master/Font%20files/Unhinted"
source=("$pre_url/CambayDevanagari-Bold.ttf"
	"$pre_url/CambayDevanagari-BoldOblique.ttf"
	"$pre_url/CambayDevanagari-Oblique.ttf"
	"$pre_url/CambayDevanagari-Regular.ttf")
md5sums=('b0207c70059abd9c7a5a1ac98a9cb8cb'
         'e5b100f3677dc9199bc554a8acc4d5b3'
         'a7243e07958114de5126553fd833064a'
         'cf37a2093ad37dd787355247d9903c03')
package() {
	install -d "$pkgdir/usr/share/fonts/TTF/devanagari"
	install -t "$pkgdir/usr/share/fonts/TTF/devanagari" -m644 *.ttf
}

