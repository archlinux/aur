# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.42.1
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
b2sums_x86_64=('773959fd8f1d89bb02c31e22f0ee49110d7c13274f3236a55b5b352507543c3ecb3cc94a70b871c63e277c9dad0203da71cb52520f2b22c0b901721e479b68c9')
b2sums_aarch64=('05224eeb5f7fff548851ee5c3ba041286b3aa5f74bf397d9faaf29d48a6eb4b09f32449fe3e8a8881c9c92bf2b54b817b47cfbbc63c9f7ed46604f2e384fd1b5')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
