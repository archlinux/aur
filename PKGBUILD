# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.55.3
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
b2sums_x86_64=('d8a0c3b4352a31b09ec9ea0ca0da4de455cf828aae64894cf438007df63c16307ef4acbc140700548ed7b14a84c358f796dbb034de7a076eb2091c91c52e3ef1')
b2sums_aarch64=('23a9b3c2f312d1257aeef6b5dfd352fad437ce1b7e3c7c13c0aec7424808a5b4072a3c8c55e4cb75467d31e91da934b84b6520664068810118e2df59232aa233')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
