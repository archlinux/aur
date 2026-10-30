# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.55.4
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
b2sums_x86_64=('6a20bac7af54ac5c4d790821aefc07654d4455464166c158ed1783e01a421d4758dc037081ab5f33959db8fc4571500c581a943943f944adc20f93a65b90cfdb')
b2sums_aarch64=('841655eabcabbc80144d124ce80eacb97a160ecdcce32cbb5a4b20417e18d149e97bfcf152380a33ee9a36f3507d37067af898dfd29b5648b9cc7af811bbcdb7')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
