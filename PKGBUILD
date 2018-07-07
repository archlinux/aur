#Maintainer: Shajil K Joshy <shajilkrazy@gmail.com>
pkgname=fonts-rajdhani
pkgver=2.000
pkgrel=1
pkgdesc="Open-source unicode font for Devanagari."
url="http://github.com/itfoundry/rajdhani"
license=('custom:OFL')
arch=(any)
pre_url="http://raw.githubusercontent.com/itfoundry/rajdhani/master/build/Rajdhani"
source=("$pre_url-Regular.otf"
	"$pre_url-Light.otf"
	"$pre_url-Medium.otf"
	"$pre_url-SemiBold.otf"
	"$pre_url-Bold.otf")
md5sums=('b42c5e669a332c51fef0f4a79f0723f0'
         '26d4ea561a65d4bff13e00c6a0083646'
         '11ef3a82ba755cb2b95f564d0e48c6d1'
         '03f28c7e0be4d33c1d91505f4180468c'
         '1b2f9c3988ef955ffd0bd97461a29e24')

package() {
	install -d "$pkgdir/usr/share/fonts/devanagari"
	install -t "$pkgdir/usr/share/fonts/devanagari" -m644 *.otf
}
