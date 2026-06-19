# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.42.14
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
b2sums_x86_64=('37ca1f4022138bded4970990f7d3d7236ad5cb2c29df16649dbf77156a8a29c8229736ab063674afcf8c6e512300c6d8223c0975c6a9195a7c9c6e4dee4a697a')
b2sums_aarch64=('8c826b429693a97151de873858d9783b6754f91b94913ebd526183194c8526d697a010b348bdde4fdd8e7e26e8608979e39f0eb5467961175ebc0fc19a8cd6ec')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
