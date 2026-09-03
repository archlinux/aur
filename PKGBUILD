# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.50.10
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
b2sums_x86_64=('143e2683efde068f63875ad035d00b8531873a9769a97e1aa6f4ea69b44b7f9e19d1350d3f89c288425301cb1c7dedd617217a3eae81c4e2f0d326b4695b7d01')
b2sums_aarch64=('d16ec9919b3c24a6473f7de31ce5041cfee8f18ea25108552b46988a42d7142a8f34255f70d0f4d70d605be6c4b93c2cd38cc77233101aa01cc9caf433b794d2')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
