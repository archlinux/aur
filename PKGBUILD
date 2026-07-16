# Maintainer: Sönke Köster <skoester@cubuzz.de>

pkgname="tigerbeetle-bin"
pkgver=0.17.9
pkgrel=1
license=('Apache-2.0')
pkgdesc="A distributed financial accounting database designed for safety and performance"
arch=('x86_64')
url="https://tigerbeetle.com"

source=("${pkgname}-${pkgver}.zip::https://github.com/tigerbeetle/tigerbeetle/releases/download/${pkgver}/tigerbeetle-x86_64-linux.zip")
sha256sums=('af71f2c0057e3b409bf79940fa94894b738187b0d4f1e711097bca15df5d8cd4')

package () {
	install -Dm755 ./tigerbeetle -t "$pkgdir/usr/bin"
}

install=${pkgname}.install
