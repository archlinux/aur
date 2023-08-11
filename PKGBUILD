# Maintainer: iff <iff@ik.me>
pkgname="pay-respects-bin"
pkgver=0.4.12
pkgrel=1
pkgdesc="Terminal command correction, alternative to thefuck written in Rust."
arch=("x86_64")
url="https://github.com/iffse/pay-respects"
license=('AGPL')
makedepends=()
provides=('pay-respects')
conflicts=('pay-respects')
source=("$pkgname-$pkgver-$pkgrel::https://github.com/iffse/pay-respects/releases/download/v$pkgver/pay-respects-ubuntu-latest.zip")
sha1sums=("SKIP")
replaces=("pay_respects-bin")

package() {
	install -Dm755 "pay-respects" "$pkgdir/usr/bin/pay-respects"
}
