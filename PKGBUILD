# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.43.5
pkgrel=1
pkgdesc="A command-line tool for Stripe"
arch=("x86_64" "aarch64")
url="https://stripe.com/docs/stripe-cli"
license=("Apache-2.0")
depends=()
provides=("stripe" "stripe-cli")
conflicts=("stripe-cli")
source_x86_64=("https://github.com/stripe/stripe-cli/releases/download/v$pkgver/stripe_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("https://github.com/stripe/stripe-cli/releases/download/v$pkgver/stripe_${pkgver}_linux_arm64.tar.gz")
b2sums_x86_64=('50e5cb6753320f2cea6874ff52da7dc4ceababf615f19d947bb2c385327fe1e7aa23edec8a5bab4591445d0ca7cb609910d2d3a33607eb819d38865d8871b173')
b2sums_aarch64=('abd7572b6ac9b43519c6a61cc55194cffe251e27ac18b82b34c9ac24d7867e0e643782274ff15ce9007bb2d7765213ccc0c6f5f8acbd80aea02e0c6a44e08ef8')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
