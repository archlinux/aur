# Maintainer: Sönke Köster <skoester@cubuzz.de>

pkgname="tigerbeetle-bin"
pkgver=0.16.12
pkgrel=1
epoch=0

pkgdesc="A distributed financial accounting database designed for safety and performance"
arch=('x86_64')
url="https://tigerbeetle.com"

source=("${pkgname}-${pkgver}.zip::https://linux.tigerbeetle.com")
sha256sums=('d6a16045ace74ec54cc378c12bc75972b663a7ba9a4efc517f0ea6824516b236')

package () {
	mkdir -p "$pkgdir/usr/bin"
	cp ./tigerbeetle "$pkgdir/usr/bin"
}
