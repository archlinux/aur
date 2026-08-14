# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.50.0
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
b2sums_x86_64=('ea3d9a8ee62adc51d535705b53f649607fd0620ae49b227a68dd8f159b68582ce3d46e9fb2b30617f440a1f161435f3ba3ecca36d5f9e25dce8d5d242ad6af5e')
b2sums_aarch64=('0e6cdb39554734cb07c05856db52effd1ee5cfe3ea37d9e44719f067a0bbff7c8da6ac2993c303965e56235e68d7e8721666658038e4d721e220786262429d1f')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
