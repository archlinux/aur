# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=wifiman
pkgver=1.1
pkgrel=1
pkgdesc="Minimalistic wpa_supplicant configuration manager"
arch=('any')
url='https://github.com/BiteDasher/wifiman'
license=('MIT')
depends=('bash' 'sudo' 'sed' 'net-tools' 'wireless_tools' 'wpa_supplicant' 'dhclient' 'systemd')
optdepends=(
	'zenity: Run wifigui'
)
provides=('wifigui')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/wifiman/archive/${pkgver}.tar.gz")
sha256sums=("a4bbab70a43200fdd089d7a7ac5982430c5e9199cbb31d9bf6e67388dbc8ea20")
package() {
mkdir -p $pkgdir/usr/bin
install -m 775 "$srcdir/$pkgname-$pkgver/wifiman" "$pkgdir/usr/bin/wifiman"
install -m 775 "$srcdir/$pkgname-$pkgver/wifigui" "$pkgdir/usr/bin/wifigui"
}
