#Maintainer: Shajil K Joshy <shajilkrazy@gmail.com>
pkgname=fonts-laila
pkgver=2.000
pkgrel=1
pkgdesc="Open-source unicode font for Devanagari."
url="http://github.com/itfoundry/laila"
license=('custom:OFL')
arch=(any)
pre_url="http://raw.githubusercontent.com/itfoundry/laila/master/build/Laila"
source=("$pre_url-Regular.otf"
	"$pre_url-Light.otf"
	"$pre_url-Medium.otf"
	"$pre_url-SemiBold.otf"
	"$pre_url-Bold.otf")
md5sums=('c01ec64c362a42922c38895078bfc8b7'
         'aee14fd65f36fb825b0037e26f574868'
         '9b2acf4575d13b371ee140d17aa1ae69'
         'b71fd611e6ac450622515fcd9ebd5a87'
         'aefb6e3990c7ab781632a4b44eb12e50')

package() {
	install -d "$pkgdir/usr/share/fonts/devanagari"
	install -t "$pkgdir/usr/share/fonts/devanagari" -m644 *.otf
}
