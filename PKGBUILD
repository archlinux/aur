# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.54.1
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
b2sums_x86_64=('09a7be3f52ae2252c82a488bb93ca99daff83cba372a4a3a6a5e8231ac6bff3a954873d7b873672c59589c4f0111c6fe36e63e478df1a776cce6a40d70e4e79a')
b2sums_aarch64=('89ddc6c7d6ba42577b8206ad63091597817e735ec7bacb07351e60828ec4d7091930e6f56b64e1abfd8a63d7a484fd2b387a64ae72eaaa7de98441bde10ba16e')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
