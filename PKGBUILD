# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.53.0
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
b2sums_x86_64=('3931f206c0a3e3aca5f2ad34c64d55e50dd597c72c3af108ddbe97cf48a661de93dc089d91449e3928fccccb0a0064033c79dc79c8ccbf180826fb6a0cd726a1')
b2sums_aarch64=('5ab227ab3310f6a8d2a6793f5fe878d74768ddbb8042572bde0eadde266f4e3a2b30b21b417b3c4e76dbd3c2513fa36668795fc947d931daaf1767958d9b3275')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
