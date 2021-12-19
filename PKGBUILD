# Maintainer: iohzrd <iohzrd at gmail dot com>

pkgname=packetcrypt
pkgver=0.4.4
pkgrel=1
pkgdesc="PacketCrypt implementation in Rust (Github binary release)"
arch=("x86_64")
url="https://pkt.cash"
license=("LGPL")
depends=()
provides=("packetcrypt")
conflicts=("packetcrypt")
source=("https://github.com/cjdelisle/packetcrypt_rs/releases/download/packetcrypt-v${pkgver}/packetcrypt-v${pkgver}-linux_amd64")
sha256sums=("53443070472d8677b34251a910c9a51d9b49a8a77b534411f09dbc3bd0780f7a")

package() {
	mkdir -p "$pkgdir"/usr/bin
	install -m755 "packetcrypt-v${pkgver}-linux_amd64" "$pkgdir"/usr/bin/packetcrypt
}