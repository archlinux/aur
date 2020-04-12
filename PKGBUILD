# Maintainer: Nils Van Zuijlen <nils.van-zuijlen@mailo.com>

pkgname=faune-font
pkgver=1.0.0
pkgrel=1
pkgdesc="Faune font designed by Alice Savoie for CNAP"
url="http://www.cnap.graphismeenfrance.fr/faune/"
arch=(any)
license=('CCPL:CC-BY-ND-4.0')
source=("http://www.cnap.graphismeenfrance.fr/faune/Faune_Fonts.zip" )
sha512sums=('8976c21fb73ba996a226699b5a4fd35fdadb06ca0a2c7e7c599cafa101eaefc834ae2f599926efd65c9519c3407b75e72a6a11694677818bd04b56611cd01113')

package() {
	cd Faune_Fonts/Otf
	install -d "$pkgdir/usr/share/fonts/${pkgname%-font}"
	install -t "$pkgdir/usr/share/fonts/${pkgname%-font}" -m644 *.otf
}
