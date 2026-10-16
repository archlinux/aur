# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.54.0
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
b2sums_x86_64=('2f323c916a34aae63cd7cf00e0571c9343cf34e720a2b51f3e8c552344e653b621550c60a9ff033bf110184f2f4e1ac5cec3f3e474d90b604ce6c5d6a923ebc4')
b2sums_aarch64=('a26d4cc9b2817d585e98c1950e830df0e60752a823ea1505af1c04949c8a66f77b21af1ef30398a0a46cedcc0aafe268a6ce505727b16857209fd557ba0c254f')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
