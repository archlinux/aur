# Maintainer: Sönke Köster <skoester@cubuzz.de>

pkgname="tigerbeetle-bin"
pkgver=0.16.54
pkgrel=1

pkgdesc="A distributed financial accounting database designed for safety and performance"
arch=('x86_64')
url="https://tigerbeetle.com"

source=("${pkgname}-${pkgver}.zip::https://github.com/tigerbeetle/tigerbeetle/releases/download/${pkgver}/tigerbeetle-x86_64-linux.zip")
sha256sums=('077dcc921ff18ce74e73d6c119a453768c07728a4262b0f5f64b5087017812dd')

package () {
	install -Dm755 ./tigerbeetle -t "$pkgdir/usr/bin"
}

install=${pkgname}.install
