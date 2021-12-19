# Maintainer: iohzrd <iohzrd at gmail dot com>

pkgname=pktd
pkgver=1.4.0
pkgrel=1
pkgdesc="The PKT full node and wallet (Github binary release)"
arch=("x86_64")
url="https://pkt.cash"
license=("ISC")
depends=()
provides=("checksig" "pktctl" "pktd" "pktwallet" "pld" "pldctl")
conflicts=("checksig" "pktctl" "pktd" "pktwallet" "pld" "pldctl")
source=("https://github.com/pkt-cash/pktd/releases/download/pktd-v${pkgver}/pktd-v${pkgver}-linux.deb")
sha256sums=("d08a482a5a3be5158d8ff612b32ea0195a9e0848870cb0907c54473597f9c727")

package() {
	echo "  -> Extracting the data.tar.gz..."
	bsdtar -xf data.tar.gz -C "$pkgdir/"

    mv "$pkgdir/bin/" "$pkgdir/usr/bin/"
}