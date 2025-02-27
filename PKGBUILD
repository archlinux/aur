# Maintainer: Nadir Boussoukaia <boussou@gmail.com>
#

pkgname=wifi_version
pkgver=1.0.0
pkgrel=1
pkgdesc='Get the WIFI version supported by your WIFI card on Linux - From WiFi 4  to WIFI 7'
arch=('any')
url='https://github.com/boussou/wifi_version'
license=('GPL3')
makedepends=('iw')
source=('git+https://github.com/boussou/wifi_version.git')

build() {
  cd "$srcdir"
}

package() {
  cd "$srcdir/wifi_version"
	install -Dm755 wifi_version "$pkgdir/usr/local/bin/wifi_version"

}

sha256sums=('SKIP')
