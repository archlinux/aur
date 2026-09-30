# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.52.2
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
b2sums_x86_64=('a4451890a7566602d0f48dc245ae5263213811a6daa013bb92c09be03791a9a418032033179fc0516f9d89100e03d5ba2f53f9badf9a04a72a64fcef4a96bddf')
b2sums_aarch64=('9365f586658b196f0ef59c833d7b5b0472652c8a2ae06e68928852df11e7b0913564ea64c311951f307cddad86241c44e54392034b82e3afb17523b0576d3b93')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
