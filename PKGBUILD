# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.55.2
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
b2sums_x86_64=('6331c92ac7890fe5a7a90af8e04db0181fb6582fb50d448857fadc55c7fc4868dc9343b45fd86b0854ac0a60f6d1774ab5c9b0d203f04ee65fd51985e106f5c2')
b2sums_aarch64=('3969ecb59c54f52abddb0e74579eb1883d386f92905ecf02b20620ad60929e08d8e655acf1eab4a830b8a773830c7d9f9ad97ce867f3bdd4bae156f7e75fa032')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
