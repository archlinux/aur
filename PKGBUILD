# Maintainer: Sönke Köster <skoester@cubuzz.de>

pkgname="tigerbeetle-bin"
pkgver=0.16.42
pkgrel=1

pkgdesc="A distributed financial accounting database designed for safety and performance"
arch=('x86_64')
url="https://tigerbeetle.com"

source=("${pkgname}-${pkgver}.zip::https://github.com/tigerbeetle/tigerbeetle/releases/download/${pkgver}/tigerbeetle-x86_64-linux.zip")
sha256sums=('a31fbc10c40ebe918a9f92893401aafeb156a2ca04193ffc941c60cfbd1c7f3b')

package () {
	install -Dm755 ./tigerbeetle -t "$pkgdir/usr/bin"
}
