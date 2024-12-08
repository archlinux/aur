# Maintainer: iff <iff@ik.me>
pkgname="pay-respects-bin"
pkgver=0.6.0
pkgrel=1
pkgdesc="Terminal command suggestion, alternative to thefuck written in Rust with AI support (All modules)"
arch=("x86_64")
url="https://github.com/iffse/pay-respects"
license=('AGPL')
makedepends=()
optdepends=()
provides=('pay-respects')
conflicts=('pay-respects')
source=("$pkgname-$pkgver-$pkgrel::https://github.com/iffse/pay-respects/releases/download/v$pkgver/pay-respects-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha1sums=('3da837a4a248decb6ddacfcc9f8825aae8f217e3')
replaces=("pay_respects-bin")

package() {
	install -Dm755 "pay-respects" "$pkgdir/usr/bin/pay-respects"
	install -Dm755 "_pay-respects-module-runtime-rules" "$pkgdir/usr/bin/_pay-respects-module-runtime-rules"
	install -Dm755 "_pay-respects-fallback-request-ai" "$pkgdir/usr/bin/_pay-respects-fallback-request-ai"
}
