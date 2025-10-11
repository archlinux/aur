# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.31.0
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
b2sums_x86_64=('79cc030d3fa45cf19b2a23ebf67e0b63a81b72a6797a0ada1b6752aaf0e8bc66c42d79d349eafc68fca80b8f531e397adf71efa8a77edc0037f020cf855f7fce')
b2sums_aarch64=('18f57fd1dc402c3e114ea4508238b5186fb8a303eb79ebdf337402f89231be09e3223c3887832dac7e37d97dfae6ae560adc879583810cb643a104b0c9fcf641')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
