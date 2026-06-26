# Maintainer: Sönke Köster <skoester@cubuzz.de>

pkgname="tigerbeetle-bin"
pkgver=0.17.8
pkgrel=1
license=('Apache-2.0')
pkgdesc="A distributed financial accounting database designed for safety and performance"
arch=('x86_64')
url="https://tigerbeetle.com"

source=("${pkgname}-${pkgver}.zip::https://github.com/tigerbeetle/tigerbeetle/releases/download/${pkgver}/tigerbeetle-x86_64-linux.zip")
sha256sums=('c69b548018c9fef9dfce83efc2f36e880ab1ef7f7e9c2182b81f9077b9a999a7')

package () {
	install -Dm755 ./tigerbeetle -t "$pkgdir/usr/bin"
}

install=${pkgname}.install
