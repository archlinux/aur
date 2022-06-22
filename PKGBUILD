# Maintainer: Denton Liu <liu.denton@gmail.com>

pkgname=netctl2qr
pkgver=1.0.0
pkgrel=1
pkgdesc="Outputs QR codes from netctl Wi-Fi profiles"
arch=(any)
url="https://github.com/Denton-L/netctl2qr"
license=('GPL2')
depends=(python-qrcode)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('51b261d90e67ebcea06aca0bbf9c99010cd0be39d0535bf883f49d425a08d24f')

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 "./$pkgname" "$pkgdir/usr/bin/$pkgname"
}
