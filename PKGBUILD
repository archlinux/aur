#Maintainer: Shajil K Joshy <shajilkrazy@gmail.com>
pkgname=fonts-khand
pkgver=2.000
pkgrel=1
pkgdesc="Open-source unicode font for Devanagari."
url="http://github.com/itfoundry/khand"
license=('custom:OFL')
arch=(any)
pre_url="http://raw.githubusercontent.com/itfoundry/khand/master/build/Khand"
source=("$pre_url-Regular.otf"
	"$pre_url-Black.otf"
	"$pre_url-Light.otf"
	"$pre_url-ExtraLight.otf"
	"$pre_url-SemiLight.otf"
	"$pre_url-SemiBold.otf"
	"$pre_url-Bold.otf"
	"$pre_url-ExtraBold.otf")
md5sums=('ce7b1cd8df7e4057532b9f9024e7a6fe'
         '29abea2330e220fd46d867dfca14569b'
         '30e29f708d7fa7bbc52242668471ccb3'
         '17b4a99e7d4c96320b27f4f570d1614d'
         '89aed336f64a9b045645ef7befac0cb3'
         '489d9f932780c061a02337f41f814539'
         '4b7453bbf2711d384d528d63125b294a'
         '6ed400dac32b9ad5cf79bac00bc18dba')

package() {
	install -d "$pkgdir/usr/share/fonts/devanagari"
	install -t "$pkgdir/usr/share/fonts/devanagari" -m644 *.otf
}
