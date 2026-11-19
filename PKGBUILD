# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.55.13
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
b2sums_x86_64=('288d74b753b0c5ebdeba5fcd84c247257455831c4246b00f3d5f6ceaeff47180d42bdb12b36564e5babaa33d645b11618808b1d68099fafdd00823e1dc90e824')
b2sums_aarch64=('c5bf1cf0391004af4c7bbe9ca7efbfe098b2a530147119bb3957c42dee472d28bffb4d9f732d72237b3ef5e5b359b0520c016dc1b8ad4cdd0b33f12e680282a4')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
