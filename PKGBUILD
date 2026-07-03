# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.43.6
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
b2sums_x86_64=('bb92532f10e06792134d8f0636006d6751153b1a6932471fda395431269d3ae189fffa238e30eadb4adc21508eb8fdbaa5abff6c99d788a40dffea84055c71bb')
b2sums_aarch64=('c12e4c0cc4d0c55374babed0e45ad1b06e6105f7dc0cdcfa08cf831a05dff0b2c6f3892b0add9f4564d9b35d1f1ffa3b1397939d75f4848fee67332e949f2d01')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
