# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.53.1
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
b2sums_x86_64=('4ddaa01a365418c99e525f88a1e8b0fa80e14df4cc49ca5bf556f08d98daca11f761b7fe08279107d6ff9600ad3fdc6b7cbc2bf656a6d2f7a3c9c89c4cb6968c')
b2sums_aarch64=('35a034989ceb172601ac0efb0013740cf96f2897e7028a6127210c88a1f7491e291ea531d0898d1118c3c295db64bc4167c003ae3c73bc24e07dea4f889440fb')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
