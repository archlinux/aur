# Maintainer: Jonny Stoten <jonny@jonnystoten.com>

pkgname=stripe-cli-bin
pkgver=1.4.5
pkgrel=1
pkgdesc="A command-line tool for Stripe"
arch=("x86_64")
url="https://stripe.com/docs/stripe-cli"
license=("Apache")
depends=()
provides=()
conflicts=(stripe-cli)
source=("https://github.com/stripe/stripe-cli/releases/download/v$pkgver/stripe_${pkgver}_linux_x86_64.tar.gz")
sha256sums=('8c9319a1f60d09d1c2607598c132e7e4839c4ce430bf724a5baa4cce10d32984')

package() {
  install -Dm 0755 stripe "$pkgdir/usr/bin/stripe"
}
