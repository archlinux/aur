# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.55.9
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
b2sums_x86_64=('bf93295ca4d6557c7d21b5adde9ee590b3a7dfc3a6ce5a88d356500be281d69e4b9cfc85c0faf39fd3ff45e34e9b9a247812aef34e158985626819b5f272cfcd')
b2sums_aarch64=('2e0a2f219947f3740cd8337d7c2c16809290223775db08e865a6de86e47560ff6bae03e689c73879c4323fdfaaba39d59473a3336ed8970bab3647b167e605ce')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
