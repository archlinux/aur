# Maintainer: iohzrd <iohzrd at gmail dot com>

pkgname=pktd
pkgver=1.5.1
pkgrel=1
pkgdesc="The PKT full node and wallet (Github binary release)"
arch=("x86_64")
url="https://pkt.cash"
license=("ISC")
depends=()
provides=("checksig" "pktctl" "pktd" "pktwallet" "pld" "pldctl")
conflicts=("checksig" "pktctl" "pktd" "pktwallet" "pld" "pldctl")
source=("https://github.com/pkt-cash/pktd/releases/download/pktd-v${pkgver}/pktd-v${pkgver}-linux.deb")
sha256sums=("3e2b51295e4a6a790910d2073426fe4ab0fe6bcbfe7c81b234006e70ac4c52b0")

package() {
	echo "  -> Extracting the data.tar.gz..."
	bsdtar -xf data.tar.gz -C "$pkgdir/"

    mv "$pkgdir/bin/" "$pkgdir/usr/bin/"
}