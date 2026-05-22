# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.41.2
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
b2sums_x86_64=('23a59c42bdfb77a06517640ddcde85289d3d6c78b51c6e19173daba5d31a43cecc137eb012309dcb37cc478c2d9e890b23d91b4b85147ff3d05205c45ff990ed')
b2sums_aarch64=('28a68a21027b87edabbee40e127b51ae29ca2135ba161143d525b0950e2ee6ab1f6e63516a379342dd2cff44bc3c270898f7e884f3f29b0bd043b7b12c78132c')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
