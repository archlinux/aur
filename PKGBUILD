# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.44.0
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
b2sums_x86_64=('8389e8ba3e7ee0157717620575282f7410d0f0b776d3ab78296006d8ed6e87c2cf106b0861bcbaf3a6645de471573b8bdc3d20cfcb01397227a3ca78999edf57')
b2sums_aarch64=('5b6e2e4d275aacd0e35585be96b405eefe1cd818362f6a1917d13212366374d2c92e913b379921846e24bd87a29899346e6fd5793806a264d8b053c0a93e27cd')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
