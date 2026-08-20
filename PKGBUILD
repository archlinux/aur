# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.50.3
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
b2sums_x86_64=('b5aa849c2ab6599b4b0e23c6411bb0694b76a99b1b42d7e0943bf9bb67244e57ea16417387ce9d11a1b9dc6c6f4eef27ce0b1b118679af1801ebdbe2444b3ea3')
b2sums_aarch64=('d4b41f5f58ff0e935b22e8276bbd4e53e18ca779600bdcb747cd16a61ca24733f5561e601f5861a676833458b4ddc43abeae40e99c5f49b332cb5b28a6582c81')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
