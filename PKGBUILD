#Maintainer: Shajil K Joshy <shajilkrazy@gmail.com>
pkgname=fonts-martel
pkgver=1.002
pkgrel=2
pkgdesc="Open-source unicode font for Devanagari with immersive-style"
url="http://github.com/typeoff/martel"
license=('custom:OFL')
arch=(any)
pre_url="https://raw.githubusercontent.com/typeoff/martel/master/Martel%20Font%20Files/OTFs"
source=("$pre_url/Martel-Bold.otf"
	"$pre_url/Martel-DemiBold.otf"
	"$pre_url/Martel-ExtraBold.otf"
	"$pre_url/Martel-Heavy.otf"
	"$pre_url/Martel-Regular.otf"
	"$pre_url/Martel-Light.otf"
	"$pre_url/Martel-UltraLight.otf")
md5sums=('eae8771a4c01327ed8923283adea8643'
         '22ac9bb105cadd4de5b127a977acff9c'
         '7152b039d6403b1c3066f1af778b36b0'
         '1b295d13c681f12e93d9dccf0a3f9d08'
         '5849e7832bfd29750c34ec9464b53605'
         '9d1ce3b19da0f7e3f1737ec218d14d0a'
         '5e107bb05924d44e0e76d1685546b000')
package() {
	install -d "$pkgdir/usr/share/fonts/devanagari"
	install -t "$pkgdir/usr/share/fonts/devanagari" -m644 *.otf
}

