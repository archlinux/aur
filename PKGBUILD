#Maintainer: Shajil K Joshy <shajilkrazy@gmail.com>
pkgname=fonts-karma
pkgver=2.000
pkgrel=1
pkgdesc="Open-source unicode font for Devanagari."
url="http://github.com/itfoundry/karma"
license=('custom:OFL')
arch=(any)
pre_url="http://raw.githubusercontent.com/itfoundry/karma/master/build/Karma"
source=("$pre_url-Regular.otf"
	"$pre_url-Light.otf"
	"$pre_url-Medium.otf"
	"$pre_url-SemiBold.otf"
	"$pre_url-Bold.otf")
md5sums=('54adea2b00c1b75a9671faf33f3e17af'
         '0a24b6726d2327e55ec45b44c3cc7c13'
         '73292a57b18eff2121e019104ec4cd10'
         'ed1da8ef9b45c71229c21fb37c9b256e'
         '75c142eb16a011a2c59f5a3fd2c47059')

package() {
	install -d "$pkgdir/usr/share/fonts/devanagari"
	install -t "$pkgdir/usr/share/fonts/devanagari" -m644 *.otf
}
