# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.55.12
pkgrel=1
pkgdesc="A command-line tool for Stripe"
arch=("x86_64" "aarch64")
url="https://stripe.com/docs/stripe-cli"
license=("Apache-2.0")
depends=("ca-certificates")
optdepends=(
  "git: Git configuration and editor integration"
  "less: preferred interactive documentation pager"
  "xdg-utils: opening browser-based login and dashboard URLs"
)
provides=("stripe" "stripe-cli")
conflicts=("stripe-cli")
source_x86_64=("https://github.com/stripe/stripe-cli/releases/download/v$pkgver/stripe_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("https://github.com/stripe/stripe-cli/releases/download/v$pkgver/stripe_${pkgver}_linux_arm64.tar.gz")
b2sums_x86_64=('afc31a198cc281251c628297b82029a862f8b0422a456edf5953b0785730312feaaecc8eedbb3fa8bbb7bb4669b66a1208b078301594ff610f5fdd87b98dde4a')
b2sums_aarch64=('4ace5197d89e8ac1647228abadbbfa10d169a4c76447bc5f02301d6859dd2fa7d85236ef3e9bd3a62773f8cbb806559bd167c36f1cb0bbcf6fb5e382d81f0cef')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
