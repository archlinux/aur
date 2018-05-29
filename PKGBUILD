#Maintainer: Shajil K Joshy <shajilkrazy@gmail.com>
pkgname=fonts-martel
pkgver=1.002
pkgrel=3
pkgdesc="Open-source unicode font for Devanagari with immersive-style"
url="http://github.com/typeoff/martel"
license=('custom:OFL')
arch=(any)
pre_url1="http://raw.githubusercontent.com/typeoff/martel/master/Martel%20Font%20Files/OTFs"
pre_url2="http://raw.githubusercontent.com/typeoff/martel_sans/master/Martel%20Sans%20Font%20Files/OTFs"
source=("$pre_url1/Martel-Bold.otf"
	"$pre_url1/Martel-DemiBold.otf"
	"$pre_url1/Martel-ExtraBold.otf"
	"$pre_url1/Martel-Heavy.otf"
	"$pre_url1/Martel-Regular.otf"
	"$pre_url1/Martel-Light.otf"
	"$pre_url1/Martel-UltraLight.otf"
	"$pre_url2/MartelSans-Bold.otf"
	"$pre_url2/MartelSans-DemiBold.otf"
	"$pre_url2/MartelSans-ExtraBold.otf"
	"$pre_url2/MartelSans-Heavy.otf"
	"$pre_url2/MartelSans-Regular.otf"
	"$pre_url2/MartelSans-Light.otf"
	"$pre_url2/MartelSans-UltraLight.otf"
)
md5sums=('eae8771a4c01327ed8923283adea8643'
         '22ac9bb105cadd4de5b127a977acff9c'
         '7152b039d6403b1c3066f1af778b36b0'
         '1b295d13c681f12e93d9dccf0a3f9d08'
         '5849e7832bfd29750c34ec9464b53605'
         '9d1ce3b19da0f7e3f1737ec218d14d0a'
         '5e107bb05924d44e0e76d1685546b000'
         '65551063d8e56eb6bddb9aaf3a2356c0'
         'e6d4e94c5ea3a042157bb1683366410d'
         'c8131a1876d194153c66e2409924632c'
         '5fc819b81ede8384ae928dc6406aab32'
         'e532cf0664bec4e3219d48d4140b5a01'
         'de140eba2dc258fc255b44886bb1d3c2'
         '116378fe89d61bc57e845a54c51662d5')
package() {
	install -d "$pkgdir/usr/share/fonts/devanagari"
	install -t "$pkgdir/usr/share/fonts/devanagari" -m644 *.otf
}

