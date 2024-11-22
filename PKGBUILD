# Maintainer: iff <iff@ik.me>
pkgname="pay-respects-bin"
pkgver=0.5.13
pkgrel=3
pkgdesc="Terminal command suggestion, alternative to thefuck written in Rust with AI support"
arch=("x86_64")
url="https://github.com/iffse/pay-respects"
license=('AGPL')
makedepends=()
optdepends=()
provides=('pay-respects')
conflicts=('pay-respects')
source=("$pkgname-$pkgver-$pkgrel::https://github.com/iffse/pay-respects/releases/download/v$pkgver/pay-respects-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha1sums=('1328b7d3a7ddaafe0b7867def1050a9e4c03b8e9')
replaces=("pay_respects-bin")

package() {
	install -Dm755 "pay-respects" "$pkgdir/usr/bin/pay-respects"
}
