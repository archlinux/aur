# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.42.11
pkgrel=1
pkgdesc="A command-line tool for Stripe"
arch=("x86_64" "aarch64")
url="https://stripe.com/docs/stripe-cli"
license=("Apache-2.0")
depends=()
provides=("stripe" "stripe-cli")
conflicts=("stripe-cli")
source_x86_64=("https://github.com/stripe/stripe-cli/releases/download/v$pkgver/stripe_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("https://github.com/stripe/stripe-cli/releases/download/v$pkgver/stripe_${pkgver}_linux_arm64.tar.gz")
b2sums_x86_64=('b339d7001a4c037bb71a8ae7484048d0a02264622c208a83fd81a3ebe41dcf51e20967bf5d22ffc69b33debeda80042596a561ee7170e0f17bedf282f62db767')
b2sums_aarch64=('336eb4ab8078979024d80c3360b7667fb425cf20a0381b5083dbe42b4d4faa513a62d98ecba88b47c99a5f337f6f6f0e2550343f23f8d293fc7b62c0bbe45f8b')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
