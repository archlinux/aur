#Maintainer: Shajil K Joshy <shajilkrazy@gmail.com>
pkgname=fonts-tillana
pkgver=1.000
pkgrel=1
pkgdesc="Open-source unicode font for Devanagari."
url="http://github.com/itfoundry/tillana"
license=('custom:OFL')
arch=(any)
pre_url="http://raw.githubusercontent.com/itfoundry/tillana/master/build/Tillana"
source=("$pre_url-Regular.otf"
	"$pre_url-ExtraBold.otf"
	"$pre_url-Medium.otf"
	"$pre_url-SemiBold.otf"
	"$pre_url-Bold.otf")
md5sums=('d7fcf11e85301b74007cab2af547a470'
         '0fadd4f309213429de1dad96772d27d5'
         'c5b73b83cdafea408aecdb8e997a5de0'
         '53697a163c5425365f8fc97c1b3ef474'
         'd895002842cc93cb47317bb5266e5983')

package() {
	install -d "$pkgdir/usr/share/fonts/devanagari"
	install -t "$pkgdir/usr/share/fonts/devanagari" -m644 *.otf
}
