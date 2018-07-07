#Maintainer: Shajil K Joshy <shajilkrazy@gmail.com>
pkgname=fonts-hind-kochi
pkgver=1.000
pkgrel=1
pkgdesc="Open-source unicode font for Malayalam"
url="http://github.com/itfondry/hind-kochi"
license=('custom:OFL')
arch=(any)
pre_url="http://raw.githubusercontent.com/itfoundry/hind-kochi/master/build/HindKochi"
source=("$pre_url-Regular.otf"
	"$pre_url-Light.otf"
	"$pre_url-Medium.otf"
	"$pre_url-SemiBold.otf"
	"$pre_url-Bold.otf"
)
md5sums=('694cadea30b06fdc764a4d69cf143220'
         '75920b20dfcdbbf7346aab1d34d0835c'
         '62b4dd6c1e17ee6c2d693883a08dc7de'
         'c2071b5a627c229899e52cb54a2f5d11'
         'e2280182b8b6c238356e4c172e4b00e5')

package() {
	install -d "$pkgdir/usr/share/fonts/malayalam"
	install -t "$pkgdir/usr/share/fonts/malayalam" -m644 *.otf
}
