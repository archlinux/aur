#Maintainer: Shajil K Joshy <shajilkrazy@gmail.com>
pkgname=fonts-teko
pkgver=2.000
pkgrel=1
pkgdesc="Open-source unicode font for Devanagari."
url="http://github.com/itfoundry/teko"
license=('custom:OFL')
arch=(any)
pre_url="http://raw.githubusercontent.com/itfoundry/teko/master/build/Teko"
source=("$pre_url-Regular.otf"
	"$pre_url-Light.otf"
	"$pre_url-Medium.otf"
	"$pre_url-SemiBold.otf"
	"$pre_url-Bold.otf")

package() {
	install -d "$pkgdir/usr/share/fonts/devanagari"
	install -t "$pkgdir/usr/share/fonts/devanagari" -m644 *.otf
}
md5sums=('86b5398537e9b0f3b2435b126aa8caf2'
         'd950f515ce14b945b19646882ef81591'
         '2d33c831153625885b0106405c38d541'
         'c31653472e98a30ecaef08d233e2d45e'
         '45d2a0611f6302deefdf00327dc99bf3')
