# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.50.5
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
b2sums_x86_64=('05327cafe225d88277d58c9d6d93818eceb2cdea715fbb51b9f3ed5e045d11145f0c19321c7f68abb1dc34d991f28d671e861ef493055571ad378ed57689c356')
b2sums_aarch64=('998f69ab06dc8aa8c27cb0c62c28656cf80b160e4a7d330461dafa64a7838ea17501d575412d7c8dc2084025bdf012e426853aafa732d681c0c597b05109f621')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
