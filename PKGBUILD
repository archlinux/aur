# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.52.0
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
b2sums_x86_64=('10d3d89bb3883c2f7ed17492bb656eecc49eb17fab27f79ebb995ced39304315e164748c64e0130e4d165849473c508c8b42b1d29722b6fc02ffe6a7390878a2')
b2sums_aarch64=('d805ac9095f83e2393dde52abade348a40f8a88ad69cd4b59eee0d3f0df890e8f1316fff55ae3746ff6e58b67788d5e7c6ff3bfc04d75a28c71298315081e994')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
