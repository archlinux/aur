# Maintainer: MaximMaximS <sklenicka dot maxim at gmail dot com>

pkgname=cdwifi
pkgver=1.0
pkgrel=1
pkgdesc="Simple login script for public WiFi in ČD trains"
arch=('any')
url="https://github.com/MaximMaximS/CDWiFi"
license=('MIT-0')
depends=('python-beautifulsoup4' 'python-requests')
source=("https://github.com/MaximMaximS/CDWiFi/releases/download/1.0/cdwifi.py")
sha256sums=("29991805ea815d7d630ee3445279285e93329a4b515a4add0cd950752e16e998")

package() {
	install -Dm755 $srcdir/cdwifi.py $pkgdir/usr/bin/cdwifi
}
