# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.55.8
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
b2sums_x86_64=('3b686b1bf13a853db2f54fccb31b844e0f7aa8e1d05b7b763faa080aa660fc4aca7b07fbb314d3d708f9df12913b62df25a9a1c0c8cfe890f262379320cf9186')
b2sums_aarch64=('986acd7bc99fd4ab6e54911fd3edaf22279b611f44221c4f12820328b0dbed57dcaf54ae4cef6f0f07058db24f4a6584387943608bfb103dc4400cd82d401bbc')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
