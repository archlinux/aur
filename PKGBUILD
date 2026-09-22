# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.51.1
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
b2sums_x86_64=('38c59df89d9729711a514d9269b501bfaf926d5f522f1ff81c220cbaaa34e8def67c6f14ac00439c548afb301f7ea50196e597f3db82f7b59a4c3a564b9036a4')
b2sums_aarch64=('67c36af5e8175ff8772f296a8041b33a3d40093180a0df7c1baecfff3b90c68c36dddee3d7690e206824fdf44018d860faa296f2b0497f768ea20ac982a04a79')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
