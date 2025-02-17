# Maintainer: Sönke Köster <skoester@cubuzz.de>

pkgname="tigerbeetle-bin"
pkgver=0.16.27
pkgrel=1

pkgdesc="A distributed financial accounting database designed for safety and performance"
arch=('x86_64')
url="https://tigerbeetle.com"

source=("${pkgname}-${pkgver}.zip::https://github.com/tigerbeetle/tigerbeetle/releases/download/${pkgver}/tigerbeetle-x86_64-linux.zip")
sha256sums=('4c5ba955ba1e98bb5c7ea1b37369603f3efbea7fc3e8e2f25cff3afcf6a5e153')

package () {
	install -Dm755 ./tigerbeetle -t "$pkgdir/usr/bin"
}
