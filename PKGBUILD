# Maintainer: iohzrd <iohzrd at gmail dot com>

pkgname=packetcrypt
pkgver=0.5.2
pkgrel=1
pkgdesc="PacketCrypt implementation in Rust (Github binary release)"
arch=("x86_64")
url="https://pkt.cash"
license=("LGPL")
depends=()
provides=("packetcrypt")
conflicts=("packetcrypt")
source=("https://github.com/cjdelisle/packetcrypt_rs/releases/download/packetcrypt-v${pkgver}/packetcrypt-v${pkgver}-linux_amd64")
sha256sums=("dc9bb69397c1c24c68dfa8c78c54fad87405ed7ac7c75bd1109e0b839a5547a9")

package() {
	mkdir -p "$pkgdir"/usr/bin
	install -m755 "packetcrypt-v${pkgver}-linux_amd64" "$pkgdir"/usr/bin/packetcrypt
}