# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=wifiman
pkgver=1.6.2
pkgrel=1
pkgdesc="Minimalistic wpa_supplicant configuration manager"
arch=('any')
url='https://github.com/BiteDasher/wifiman'
license=('MIT')
depends=('bash' 'sed' 'net-tools' 'wireless_tools' 'wpa_supplicant' 'dhcpcd' 'systemd')
optdepends=(
	'zenity: Run wifigui'
)
provides=('wifigui')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/wifiman/archive/${pkgver}.tar.gz")
sha256sums=("33e2806d988fecf1bb243d9e6d51905eff6692c83c9ed01858dafb5f07e1a1c5")
package() {
mkdir -p $pkgdir/usr/bin
install -m 775 "$srcdir/$pkgname-$pkgver/wifiman" "$pkgdir/usr/bin/wifiman"
install -m 775 "$srcdir/$pkgname-$pkgver/wifigui" "$pkgdir/usr/bin/wifigui"
}
