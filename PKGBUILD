# Maintainer: Sönke Köster <skoester@cubuzz.de>

pkgname="tigerbeetle-bin"
pkgver=0.16.19
pkgrel=1

pkgdesc="A distributed financial accounting database designed for safety and performance"
arch=('x86_64')
url="https://tigerbeetle.com"

source=("${pkgname}-${pkgver}.zip::https://github.com/tigerbeetle/tigerbeetle/releases/download/${pkgver}/tigerbeetle-x86_64-linux.zip")
sha256sums=('9222217ea8f4b4179cb4b2b4d6d94051711e06aa4dee504fb06adc15ba9c6f43')

package () {
	install -Dm755 ./tigerbeetle -t "$pkgdir/usr/bin"
}
