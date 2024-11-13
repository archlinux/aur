# Maintainer: Maki <maki@hotmilk.space>

pkgname=otf-sn-pro
pkgver=1.3.0
pkgrel=1
pkgdesc="SN Pro is based on Nunito, a brilliant rounded font."
arch=("any")
url="https://github.com/supernotes/sn-pro"
license=("OFL")
source=("SN-Pro-$pkgver.zip::https://github.com/supernotes/sn-pro/releases/download/$pkgver/SN-Pro.zip")
sha256sums=("db163ac2c3689a7490bca084ca992d757d9f861fff1eb1841989d9a1b44f2ac4")

package() {
	cd "SNPro"
	install -Dm644 *.otf -t "$pkgdir/usr/share/fonts/OTF/"
	install -Dm644 OFL.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
