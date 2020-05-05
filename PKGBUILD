# Author: Artemii Sudakov <finziyr@yandex.ru>
pkgname=wifiman
pkgver=1.6.3
pkgrel=1
pkgdesc="Minimalistic wpa_supplicant configuration manager"
arch=('any')
url='https://github.com/BiteDasher/wifiman'
license=('MIT')
depends=('bash' 'sed' 'wireless_tools' 'wpa_supplicant' 'dhcpcd' 'systemd')
optdepends=(
	'zenity: Run wifigui'
)
provides=('wifigui')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BiteDasher/wifiman/archive/${pkgver}.tar.gz")
sha256sums=("eebfe15badab455f44a9667a04974962508cff713187624c01e199224a284628")
package() {
mkdir -p $pkgdir/usr/bin
install -m 775 "$srcdir/$pkgname-$pkgver/wifiman" "$pkgdir/usr/bin/wifiman"
install -m 775 "$srcdir/$pkgname-$pkgver/wifigui" "$pkgdir/usr/bin/wifigui"
}
