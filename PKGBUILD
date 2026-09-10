# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.50.11
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
b2sums_x86_64=('196730147406c96166740ac202853697ef35e30ade00ad8651c70f2f16a089c96dbf2524f40cb4ec1d215daa9b3ec9bf66372261a197a2994f3f903fb2550e8a')
b2sums_aarch64=('9f6876540a69a7cc93e4cf84ce4367d2e7846d297ee06918a8d585c8cd97d7559ebd3ad47f0bb31712a8c0a48f1d2c1b5f53fc2dd0e0bbeaa998f22e8caecf64')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
