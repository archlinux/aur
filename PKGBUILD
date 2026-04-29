# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.40.9
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
b2sums_x86_64=('4dee67c8ff48e8032479f049501506c2e7305cab625f567ecffdeca70ddc38a03f21827fbe64959f0626c3dfa98c68fe8d8e5205f16f0bfd84be5eb84b3d5f42')
b2sums_aarch64=('d63bda91e0fe40e34aa8a7a49be47cdd237351982d0367324592dd665dad3757a38132d970b66b83a2dc9501aec48d059c3f0fa4b949e95b3ff5ffaf13b3fda0')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
