# Maintainer: iff <iff@ik.me>
pkgname="pay-respects-bin"
pkgver=0.4.4
pkgrel=1
pkgdesc="Terminal command correction, alternative to thefuck written in Rust."
arch=("x86_64")
url="https://github.com/iffse/pay-respects"
license=('AGPL')
makedepends=()
provides=('pay-respects')
conflicts=('pay-respects')
source=("$pkgname-$pkgver::https://github.com/iffse/pay-respects/releases/download/v$pkgver/pay-respects-ubuntu-latest.zip")
sha1sums=("SKIP")
replaces=("pay_respects")

package() {
	install -Dm755 "pay-respects" "$pkgdir/usr/bin/pay-respects"
}

post_upgrade() {
	echo "======================================================================"
	echo "The binary name has changed from pay-respects to pay-respects"
}
