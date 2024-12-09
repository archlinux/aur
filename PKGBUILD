# Maintainer: iff <iff@ik.me>
pkgname="pay-respects-bin"
pkgver=0.6.2
pkgrel=1
pkgdesc="Command suggestions, command-not-found and thefuck replacement written in Rust  (All modules)"
arch=("x86_64")
url="https://github.com/iffse/pay-respects"
license=('AGPL')
makedepends=()
optdepends=()
provides=('pay-respects')
conflicts=('pay-respects')
source=("$pkgname-$pkgver-$pkgrel::https://github.com/iffse/pay-respects/releases/download/v$pkgver/pay-respects-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha1sums=('1818b0e8315839290618636b88ba6b43fc2bff8a')

package() {
	install -Dm755 "pay-respects" "$pkgdir/usr/bin/pay-respects"
	install -Dm755 "_pay-respects-module-100-runtime-rules" "$pkgdir/usr/bin/_pay-respects-module-100-runtime-rules"
	install -Dm755 "_pay-respects-fallback-100-request-ai" "$pkgdir/usr/bin/_pay-respects-fallback-100-request-ai"
}
