# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.50.1
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
b2sums_x86_64=('4172a952ecc5074c63cb95f87b2221caa796e42495ec9bd573774e0909825e361a86e276b9aa655997b22653ed149f48b95d085f2585fbc130e26bc83e250bbf')
b2sums_aarch64=('5210cbb766ac8d175110ee480bf43d21596aa6be5f36a4371a5bb3d7cc440a266c97a3c0759044fa353281a7f4c8885dd768853dc9e8fcb83083faedba4a231f')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
