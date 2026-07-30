# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.45.0
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
b2sums_x86_64=('06338f279ddc3fe227581f7b810ebfa119e402722f253c172f87b0c1adc26b0e13912f519e998c1c8ad7c7ade152264fa932718b24d8ed4bc7eb32f6329c25c8')
b2sums_aarch64=('e14cf727e1f3dab0f60327197ceed4a79033c57a8cdca9f4d59aa1ba54d78617c23475cc2e7120949ee243e731db9e9373bacdd1e86f2dccf0f890f348f8f877')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
