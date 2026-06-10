# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.42.10
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
b2sums_x86_64=('0c9814c282946de03d325d429a0736df009aabb1eb4ebae78425fd259c3463229c541968d0f76f72e345e3113d8f59aa24cd458ca5284888f41caf36e63bf7df')
b2sums_aarch64=('00139d1145412e58303f93aec29dc5fbf53db5b22ac11b1d2f389af5fcda571fb1e165e7c4226788b44b91c8b831e2c3d88cecad4a484696878a94fb52be7e5f')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
