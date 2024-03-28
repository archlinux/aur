# Maintainer: Maki <maki@hotmilk.space>

pkgname=otf-sn-pro
pkgver=1.1.0
pkgrel=1
pkgdesc="SN Pro is based on Nunito, a brilliant rounded font."
arch=("any")
url="https://supernotes.app/open-source/sn-pro"
license=("OFL")
source=("https://github.com/supernotes/sn-pro/releases/download/$pkgver/SN-Pro.zip")
sha256sums=("b8953185881a741e62912033d0fdc0ad99f31e470c6a51c07859f883ec26ee19")

package() {
	cd "SNPro"
	install -Dm644 *.otf -t "$pkgdir/usr/share/fonts/OTF/"
	install -Dm644 OFL.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
