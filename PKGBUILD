# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.23.3
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
b2sums_x86_64=('1c35481f5c7768996a6cc401cc196d3b486ebd820f696586eef709220a46da18eda00386e7358ba548340298b6e5c46bc1a96390175439d4935298f6e68c5c4d')
b2sums_aarch64=('471d6f420a7b389e2951b5a07643f273d49ad5c9a9a979da93b65b49def878069252b1350dcc01838046377a2ed723b9b4a4373be086aecb9c9a9bb58c5849fc')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
