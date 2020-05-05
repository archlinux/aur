# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=wifiman
pkgver=1.6.1
pkgrel=1
pkgdesc="Minimalistic wpa_supplicant configuration manager"
arch=('any')
url='https://github.com/BiteDasher/wifiman'
license=('MIT')
depends=('bash' 'sed' 'net-tools' 'wireless_tools' 'gawk' 'wpa_supplicant' 'dhcpcd' 'systemd')
optdepends=(
	'zenity: Run wifigui'
)
provides=('wifigui')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/wifiman/archive/${pkgver}.tar.gz")
sha256sums=("fbd829f9d938842e2b21cb1a41dc94279dc43c9f24682c1fc02becc92f36073e")
package() {
mkdir -p $pkgdir/usr/bin
install -m 775 "$srcdir/$pkgname-$pkgver/wifiman" "$pkgdir/usr/bin/wifiman"
install -m 775 "$srcdir/$pkgname-$pkgver/wifigui" "$pkgdir/usr/bin/wifigui"
}
