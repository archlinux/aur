# Maintainer: Maki <maki@hotmilk.space>

pkgname=otf-sn-pro
pkgver=1.2.0
pkgrel=1
pkgdesc="SN Pro is based on Nunito, a brilliant rounded font."
arch=("any")
url="https://github.com/supernotes/sn-pro"
license=("OFL")
source=("SN-Pro-$pkgver.zip::https://github.com/supernotes/sn-pro/releases/download/$pkgver/SN-Pro.zip")
sha256sums=("1bd89ccc333df57ca959207b83282fcd6b9806d71070244394a892ea280ac792")

package() {
	cd "SNPro"
	install -Dm644 *.otf -t "$pkgdir/usr/share/fonts/OTF/"
	install -Dm644 OFL.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
