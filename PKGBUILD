# Maintainer: Maki <maki@hotmilk.space>

pkgname=otf-sn-pro
pkgver=1.5.0
pkgrel=1
pkgdesc="SN Pro is based on Nunito, a brilliant rounded font."
arch=("any")
url="https://github.com/supernotes/sn-pro"
license=("OFL")
source=("SN-Pro-$pkgver.zip::https://github.com/supernotes/sn-pro/releases/download/$pkgver/SN-Pro.zip")
sha256sums=("e8f7678e7b78a2ed9fd1efbbd7404e7722e6d1b93911550493f5381b1e7f0e31")

package() {
	cd "SNPro"
	install -Dm644 *.otf -t "$pkgdir/usr/share/fonts/OTF/"
	install -Dm644 OFL.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
