# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.28.0
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
b2sums_x86_64=('d639206e36d6920bb5672c341fb2debbb342467f84661e6d1a1089de2cda04639584351eebfb9bb8960eb997594771d7c73cdffe4f466ed34359c30007f3eeb4')
b2sums_aarch64=('7aba7a598ba897e636e41865dad7e9061318cc8942991534b53d93633b98b6a1f4d469595d6cae529025dfb93ff6572168da14b0995e40feb6228fce4273bae9')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
