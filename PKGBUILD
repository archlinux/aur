# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.55.14
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
b2sums_x86_64=('245761a49b2a538bc996d0a0f73b5a1d5ed614f0eb1da6db32c1d566848292c4571a3218e6b7a4dfbeb42bce32cb8e639247720456dc90c0dd736b05a1ae9a28')
b2sums_aarch64=('2cad371d004b29f9f75f6f054b56cff10841c7d8b433287d1a526fe0e577b47077c249260c2efaa0c4bdeb14a7effce3493ce8fccc1df90c0a365af00de8a59c')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
