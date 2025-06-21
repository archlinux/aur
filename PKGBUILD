# Maintainer: Sönke Köster <skoester@cubuzz.de>

pkgname="tigerbeetle-bin"
pkgver=0.16.45
pkgrel=1

pkgdesc="A distributed financial accounting database designed for safety and performance"
arch=('x86_64')
url="https://tigerbeetle.com"

source=("${pkgname}-${pkgver}.zip::https://github.com/tigerbeetle/tigerbeetle/releases/download/${pkgver}/tigerbeetle-x86_64-linux.zip")
sha256sums=('a2f7c115cec0c784fac8cd27983de80c00f302fff22b1f287af02907f3b58c6d')

package () {
	install -Dm755 ./tigerbeetle -t "$pkgdir/usr/bin"
}
