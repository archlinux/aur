# Maintainer: DrRac27 <drrac27 at riseup dot net>

pkgname=vanity-monero-bin
pkgver=0.2.4
pkgrel=1
pkgdesc="Generates vanity address for CryptoNote currencies. Currently only Monero main net and test net are supported."
arch=("x86_64")
url="https://github.com/Equim-chan/vanity-monero"
license=("MIT")
provides=("vanity-monero=$pkgver")
source=("https://github.com/Equim-chan/vanity-monero/releases/download/${pkgver}/vanity-monero-linux-64.tar.xz")
sha256sums=("fbd4ddfbc4dc0ff80beda753b9b359e69d1ece21fee7a8659d6dc22f9a2293af")

prepare() {
	tar xf vanity-monero-linux-64.tar.xz
}

package() {
	install -Dm 755 vanity-monero "$pkgdir/usr/bin/vanity-monero"
	install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/vanity-monero/LICENSE"
}
