# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.43.2
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
b2sums_x86_64=('c8adb77c32906c3594935f8e57a9cebe7cea298eddd34ac389bbfa55b6ff6b96637ef9897ef8fcf1fad94d57f66be535c1bb87ac8896ca5c7e5e21ec6b23e9b2')
b2sums_aarch64=('f7dd70865fb7bf7e60690a7614c93bb4a2ebfe990d935b8a39636ce09ff0d009739eb4ddaacac2b88ff166cb7bfe39f1bc6d880c04fb766ed0a3fb9583a56d7a')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
