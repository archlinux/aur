# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.55.10
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
b2sums_x86_64=('264fb319edcc07db789bf36ea59d2a3161b110e22e50320333f80c6f35a67556608ddc99625e5f427e31abc2a60cb4248262d32dcfc3f2225c0bba79f3b2471a')
b2sums_aarch64=('107a400007a977031d50d63105a8b92f6d906319350c88d28559e67eef769d8bebc2706248f5dc7674cb85531737c73c40c5e69b9ee026c408cced088c6c91d5')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
