# Maintainer: iohzrd <iohzrd at gmail dot com>

pkgname=pktd
pkgver=1.6.1
pkgrel=1
pkgdesc="The PKT full node and wallet (Github binary release)"
arch=("x86_64")
url="https://pkt.cash"
license=("ISC")
depends=()
provides=("checksig" "pktctl" "pktd" "pktwallet" "pld" "pldctl")
conflicts=("checksig" "pktctl" "pktd" "pktwallet" "pld" "pldctl")
source=("https://github.com/pkt-cash/pktd/releases/download/pktd-v${pkgver}/pktd-v${pkgver}-linux.deb")
sha256sums=("b0f3d8f65543015cb87c59806d92558ac48e865938214d56925ee2851731ff1a")

package() {
	echo "  -> Extracting the data.tar.gz..."
	bsdtar -xf data.tar.gz -C "$pkgdir/"

    mv "$pkgdir/bin/" "$pkgdir/usr/bin/"
}