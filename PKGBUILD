# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.45.2
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
b2sums_x86_64=('29bedcc3f7efbe3522f84803cbb370251c6921c967e61b2247873ead8833f9585087bb9251ad7f075a45e52fc9e3c5419ccb8ecc708164f2344c50940749f272')
b2sums_aarch64=('bbbb0318583b69f8b733febfab10c0a430ab34480acb61f52bedaa1af2fdcd673666593e44692a897a7875f526fc1f23cb073ed3b674fff746fc87b71320b50f')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
