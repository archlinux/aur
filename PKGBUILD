# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.51.0
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
b2sums_x86_64=('e6c931293d356108a49d4798e7cd82862d3a093c0bc1135436a5081dc702bc88eb379f8dfd47237ae8770e43a2980067f80878f27c29bdf2a49cf4cc545e9519')
b2sums_aarch64=('9f9df39a8da2274501bb3cbd67905737e3de71211482d09221e70ab56cc3b10c82d4acb105b7de612f5ee36b806bbb2a788ca2ece41fcba779304a14afab30e5')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
