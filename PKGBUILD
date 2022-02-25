# Maintainer: iohzrd <iohzrd at gmail dot com>

pkgname=packetcrypt
pkgver=0.5.1
pkgrel=1
pkgdesc="PacketCrypt implementation in Rust (Github binary release)"
arch=("x86_64")
url="https://pkt.cash"
license=("LGPL")
depends=()
provides=("packetcrypt")
conflicts=("packetcrypt")
source=("https://github.com/cjdelisle/packetcrypt_rs/releases/download/packetcrypt-v${pkgver}/packetcrypt-v${pkgver}-linux_amd64")
sha256sums=("7c3e097b9f9bab0c0c59e2779fd7c8231be29672e4faf5202e82a853e527d874")

package() {
	mkdir -p "$pkgdir"/usr/bin
	install -m755 "packetcrypt-v${pkgver}-linux_amd64" "$pkgdir"/usr/bin/packetcrypt
}