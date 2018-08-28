# Maintainer: DrRac27 <drrac27 at riseup dot net>

pkgname=vanity-monero-bin
pkgver=v0.2.6
pkgrel=1
pkgdesc="Generates vanity address for CryptoNote currencies. Currently only Monero main net and test net are supported."
arch=("x86_64")
url="https://github.com/Equim-chan/vanity-monero"
license=("MIT")
provides=("vanity-monero=$pkgver")
source=("https://github.com/Equim-chan/vanity-monero/releases/download/${pkgver}/vanity-monero-linux-64.tar.xz")
sha256sums=("eae8cb0130b2a238051a880bac5d7c122716eb9593112c7b0c9161f0fda4deaf")

prepare() {
	tar xf vanity-monero-linux-64.tar.xz
}

package() {
	install -Dm 755 vanity-monero "$pkgdir/usr/bin/vanity-monero"
	install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/vanity-monero/LICENSE"
}
