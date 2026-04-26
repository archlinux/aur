# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.40.8
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
b2sums_x86_64=('1eb0b5dc178c28d9502435382455dac760f6daa611f14a017917a43f68a3113063ebfa6d3df55615c2fee664913057139d28a7b043f865b16ec763fdfb816d9b')
b2sums_aarch64=('51e14fc5edd9180d1559a42ca70d570f0e99a0d2b817a597f34b018e548380de6a4ff8d0b3b94c5e991a3f6d0f4b5f8f65ba2c060edbdcd9816d547f01eeffe7')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
