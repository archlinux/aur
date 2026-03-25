# Maintainer: Sönke Köster <skoester@cubuzz.de>

pkgname="tigerbeetle-bin"
pkgver=0.16.78
pkgrel=1
license=('Apache-2.0')
pkgdesc="A distributed financial accounting database designed for safety and performance"
arch=('x86_64')
url="https://tigerbeetle.com"

source=("${pkgname}-${pkgver}.zip::https://github.com/tigerbeetle/tigerbeetle/releases/download/${pkgver}/tigerbeetle-x86_64-linux.zip")
sha256sums=('d32d7ce6aefd76559eff93efc17e74585243581059d47d988155458e4aaa2beb')

package () {
	install -Dm755 ./tigerbeetle -t "$pkgdir/usr/bin"
}

install=${pkgname}.install
