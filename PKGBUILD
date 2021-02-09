# Maintainer: Jonny Stoten <jonny@jonnystoten.com>

pkgname=stripe-cli-bin
pkgver=1.5.9
pkgrel=1
pkgdesc="A command-line tool for Stripe"
arch=("x86_64")
url="https://stripe.com/docs/stripe-cli"
license=("Apache")
depends=()
provides=()
conflicts=(stripe-cli)
source=("https://github.com/stripe/stripe-cli/releases/download/v$pkgver/stripe_${pkgver}_linux_x86_64.tar.gz")
sha256sums=('bafb8b9ea5c64aa0a0e6a30e81275ddc87e5dd0a0c977b32fa42c9ef4c4f633c')

package() {
  install -Dm 0755 stripe "$pkgdir/usr/bin/stripe"
}
