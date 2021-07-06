# Maintainer: iohzrd <iohzrd at gmail dot com>

pkgname=packetcrypt
pkgver=0.4.3
pkgrel=1
pkgdesc="PacketCrypt implementation in Rust (Github binary release)"
arch=("x86_64")
url="https://pkt.cash"
license=("LGPL")
depends=()
provides=("packetcrypt")
conflicts=("packetcrypt")
source=("https://github.com/cjdelisle/packetcrypt_rs/releases/download/packetcrypt-v${pkgver}/packetcrypt-v${pkgver}-linux_amd64")
sha256sums=("a7dfcf8e081e25ff6cfdb4d8bf0ddb686cc00979a313d80cb9acbe1b40ec1881")

package() {
	mkdir -p "$pkgdir"/usr/bin
	install -m755 "packetcrypt-v${pkgver}-linux_amd64" "$pkgdir"/usr/bin/packetcrypt
}