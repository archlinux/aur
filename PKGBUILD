# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.55.1
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
b2sums_x86_64=('f9a1650133de609c75723f752dfae6526f915202f85d0a48a4c070f44e4eaafbef45f0ef84cebe2be07cf58ba8d8701a42a52536db60b5a756b5fafe32ca2450')
b2sums_aarch64=('0e44cd4dbcc1a4c058dab4bbc1845061b983df6b19da96c933db14ee1bfd1ef1665813ad92250b3c38929ad4095e062e3b5906bc1428c470dd929daffa7e697d')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
