# Maintainer: iohzrd <iohzrd at gmail dot com>

pkgname=pktd
pkgver=1.6.0
pkgrel=1
pkgdesc="The PKT full node and wallet (Github binary release)"
arch=("x86_64")
url="https://pkt.cash"
license=("ISC")
depends=()
provides=("checksig" "pktctl" "pktd" "pktwallet" "pld" "pldctl")
conflicts=("checksig" "pktctl" "pktd" "pktwallet" "pld" "pldctl")
source=("https://github.com/pkt-cash/pktd/releases/download/pktd-v${pkgver}/pktd-v${pkgver}-linux.deb")
sha256sums=("ed7bdabb2b8404b7b243dae5e92f947417736c1ebff35c279097eec09f75de06")

package() {
	echo "  -> Extracting the data.tar.gz..."
	bsdtar -xf data.tar.gz -C "$pkgdir/"

    mv "$pkgdir/bin/" "$pkgdir/usr/bin/"
}