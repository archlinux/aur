# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.26.5
pkgrel=1
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver-116.AppImage")
sha256sums=('ff649f16dcf9fffd5da8832b564bdc219f7959277f3673c443e6d5c3331b643f')
options=('!strip')

package() {
	set -eu

	install -Dm755 atomicwallet-$pkgver-*.AppImage "$pkgdir/usr/bin/atomicwallet"
}
