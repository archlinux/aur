# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.32.0
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
b2sums_x86_64=('6e994651d49444db94936d26f23d1602623db0e564a6c9b75731d16df542e1347e147b58279aaebb4f2572a1e6cd95bd253772b09e9674c8f53d1453b66d24f8')
b2sums_aarch64=('38ff9c864e0888bfaf5138d8f7e7c7f2dcbeef933e17754149bccd4b9ddb39dcc0b5aa265d861f4447fb5ccb6bff112810f02f5e610897b199af0ab869354643')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
