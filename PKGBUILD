# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.55.7
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
b2sums_x86_64=('6c20fd21badeaea6763a641fa7f268ba3b09262a30941b68b759bab0cdc05aa066aa55634243c728443f22aeb09a1de1db8a752de7c05c05b9c0b54f76dc4224')
b2sums_aarch64=('3b027ea8025ed7e434a722ef556280dacd2e3dbe0eb2c0c7e5b2593b1efa3780f69b04b8d9980a3a0fbf8136642646ede925de152b50d2b8b5398eca58200f10')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
