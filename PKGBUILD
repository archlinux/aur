# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.50.6
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
b2sums_x86_64=('1ce2cadeaff4e6c09904edd83ff2b8b81c2f62aa2720a962e35ea9f0927a79bf79307b9f33aed43267f8e0334dd4ece3bb91f95b4a6d390dd3e03cc6d961884a')
b2sums_aarch64=('f68734c72118b26d5a4ab3032ef205f93019f3cb4a6df9fd27e10141d7e408addcfed426ef96d319e7ef8e57aa85bee2f263b9b58fc26770c3f0210eca7feed4')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
