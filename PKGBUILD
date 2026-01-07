# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.34.0
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
b2sums_x86_64=('58cc658ce687910b0bdfd6bdfdd9af730d19c68a22ceb217006d8d2ed245eef2c5d842cbbe1393c0e5c7f1be813befb0e0fb727e8d4cd8919d473a4c07cbd9e7')
b2sums_aarch64=('0922e37b9d48ef9c18d0d845a60b4d780f3e8bade29a130a5e1df1805faa586864d21fc2a9076c5070cd4acb70255680db9be5a429fe7d3e1dac307493ee566a')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
