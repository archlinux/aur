# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.55.11
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
b2sums_x86_64=('ca548ba1e8c6b1a30e26421417eb0fb8af8ba39a8582650b9c5bfbe2c173c8ec1504261718cd1551a34855b0a295b3844fc2ccc50b74fd3a542c17acd50060cc')
b2sums_aarch64=('862dd95016f4534bb1d882567801d0bf21e84271e4da8bfd1d4241549cc31d31407b3b5480a9523afb42c7164503f896719b0c9d78b83c2cc20a8a9a12a6d3c5')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
