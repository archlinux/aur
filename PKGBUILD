# Maintainer: Maki <maki@hotmilk.space>

pkgname=otf-sn-pro
pkgver=1.0.0
pkgrel=2
pkgdesc="SN Pro is based on Nunito, a brilliant rounded font."
arch=("any")
url="https://supernotes.app/open-source/sn-pro"
license=("OFL")
source=("https://github.com/supernotes/sn-pro/releases/download/$pkgver/SN-Pro.zip")
sha256sums=("3ede9d0f787fb819e9e7096bded9c1793a92ac88dd06cc28ae08d6a5c1aa2dfe")

package() {
	cd "SNPro"
	install -Dm644 *.otf -t "$pkgdir/usr/share/fonts/OTF/"
	install -Dm644 OFL.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
