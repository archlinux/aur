# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.40.3
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
b2sums_x86_64=('f81d5ee72250f834c9eb5e5811ac0b7f78b6e07cd7c416c70f7f34ef7a603c8d8085f05a6ee43ef4beff65b1de2defb5f9cf45d0894bad0e33f3aaa96ef81b27')
b2sums_aarch64=('c5e882a302edfdad4180f194fb69d4cf6b008e7f8889cebc583ade3c01fb8fd6b982f212f280d7665b13076949c6c226de6adb94f8ca3718394490d958a117a2')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
