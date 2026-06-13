# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.42.13
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
b2sums_x86_64=('0d9bc340035f968d43a237ebc00ea64f86f36f982b6c4f227183c227f787d450e13f0ebcace340d4d43cea270ba2e53d8ad90174bd84007d3d3ef16dafe36e36')
b2sums_aarch64=('1fbd80e1d16ff7ce1f8495a368076504f52837a8ffc193cdc90384b6d7cb6a70b17fb62315805d156fdcd7aa48f567c9acd212e24727a67642e293a64a1dc00d')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
