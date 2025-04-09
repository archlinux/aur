# Maintainer: Sönke Köster <skoester@cubuzz.de>

pkgname="tigerbeetle-bin"
pkgver=0.16.35
pkgrel=1

pkgdesc="A distributed financial accounting database designed for safety and performance"
arch=('x86_64')
url="https://tigerbeetle.com"

source=("${pkgname}-${pkgver}.zip::https://github.com/tigerbeetle/tigerbeetle/releases/download/${pkgver}/tigerbeetle-x86_64-linux.zip")
sha256sums=('a39d100bcacfa821dd8f6a0f90fe3a7f6798b8a444a0b76a4be845ab54ba3204')

package () {
	install -Dm755 ./tigerbeetle -t "$pkgdir/usr/bin"
}
