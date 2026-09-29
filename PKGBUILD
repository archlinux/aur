# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.52.1
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
b2sums_x86_64=('145a581e9684c783cbb91f72ee3340b985f998c7d36ae0a3083d5cf25f476b89518a314e030fbced8449f5be5fefbea77e7c96d08debdf5720dc2831af2fdebd')
b2sums_aarch64=('10b2076967aa2d52504af07b85710afacf2b9add44da1b0ce9909d5a31b2c7fab7f35758305ed423815d3821bd13d3cea60f9e86506c5394bc4f485e4fc47749')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
