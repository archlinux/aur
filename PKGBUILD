# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.35.0
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
b2sums_x86_64=('8f51825176ada1d9691b643046ab10d98022ff4744fd97395f38c9ba1591906f1039eaad6d7227c3c229e5a3690772bb59d89273c25623bc4c01b39cc4dbd66e')
b2sums_aarch64=('d25d7c4766d6200e75402bef3061113392c6888790a20f5ccd5640b3473481dd1fe90a2fa7eaa71cc141554b11b0aa9676bfb7967f984f9e9eaaaebd471a1eaa')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
