# Maintainer: iamawacko <iamawacko@protonmail.com>
pkgname="siera-bin"
pkgver=0.2.0
pkgrel="1"
pkgdesc="A CLI tool for Hyperledger Aries written in Rust"
arch=(x86_64)
license=('MIT')
source=(https://github.com/animo/siera/releases/download/v${pkgver}/linux-x86_64-siera);
depends=()
provides=('siera')
sha256sums=('e9ffcd91c0f458f22d8ddafdc9f9ad08c8ec60378799d07e318e627944b63ac6')

package() {
	install -Dm0755 "linux-x86_64-siera" "$pkgdir/usr/bin/siera"
}
