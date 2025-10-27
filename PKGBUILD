# Maintainer: Sönke Köster <skoester@cubuzz.de>

pkgname="tigerbeetle-bin"
pkgver=0.16.60
pkgrel=1

pkgdesc="A distributed financial accounting database designed for safety and performance"
arch=('x86_64')
url="https://tigerbeetle.com"

source=("${pkgname}-${pkgver}.zip::https://github.com/tigerbeetle/tigerbeetle/releases/download/${pkgver}/tigerbeetle-x86_64-linux.zip")
sha256sums=('d44424b3baf96a4b56c8413451b0f44a337cd8d4b7bd0d25ac5d62e6ef3a84cd')

package () {
	install -Dm755 ./tigerbeetle -t "$pkgdir/usr/bin"
}

install=${pkgname}.install
