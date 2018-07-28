# Maintainer: Caleb Woodbine <gitlab.com/BobyMCbobs>
pkgname=easy-deauth
pkgver=1.1
pkgrel=1
pkgdesc="Send deauth packages to your favourite devices on your private WiFi network."
arch=('any')
url="https://gitlab.com/BobyMCbobs/${pkgname}"
license=('GPL')
depends=('net-tools' 'aircrack-ng')
source=("https://gitlab.com/BobyMCbobs/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.zip")
md5sums=('d7e78fa9cc15cc8c5d9f1d2eb955cc25')

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
