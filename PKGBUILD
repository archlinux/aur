# Maintainer: Maki <maki@hotmilk.space>

pkgname=otf-sn-pro
pkgver=1.4.0
pkgrel=1
pkgdesc="SN Pro is based on Nunito, a brilliant rounded font."
arch=("any")
url="https://github.com/supernotes/sn-pro"
license=("OFL")
source=("SN-Pro-$pkgver.zip::https://github.com/supernotes/sn-pro/releases/download/$pkgver/SN-Pro.zip")
sha256sums=("d746f61b0a25d10b159e4a5ac577cf66522fbc7faf66defcce207e8379696a66")

package() {
	cd "SNPro"
	install -Dm644 *.otf -t "$pkgdir/usr/share/fonts/OTF/"
	install -Dm644 OFL.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
