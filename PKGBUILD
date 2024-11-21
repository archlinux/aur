# Maintainer: iff <iff@ik.me>
pkgname="pay-respects-bin"
pkgver=0.5.12
pkgrel=1
pkgdesc="Terminal command suggestion, alternative to thefuck written in Rust with AI support"
arch=("x86_64")
url="https://github.com/iffse/pay-respects"
license=('AGPL')
makedepends=()
optdepends=()
provides=('pay-respects')
conflicts=('pay-respects')
source=("$pkgname-$pkgver-$pkgrel::https://github.com/iffse/pay-respects/releases/download/v$pkgver/pay-respects-ubuntu-latest.zip")
sha1sums=('90b9bacbcdeb229cce423b69dc39fb22c7233418')
replaces=("pay_respects-bin")

package() {
	install -Dm755 "pay-respects" "$pkgdir/usr/bin/pay-respects"
}
