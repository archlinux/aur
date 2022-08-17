# Maintainer: Jonny Stoten <jonny@jonnystoten.com>

pkgname=stripe-cli-bin
pkgver=1.11.0
pkgrel=1
pkgdesc="A command-line tool for Stripe"
arch=("x86_64")
url="https://stripe.com/docs/stripe-cli"
license=("Apache")
depends=()
provides=()
conflicts=(stripe-cli)
source=("https://github.com/stripe/stripe-cli/releases/download/v$pkgver/stripe_${pkgver}_linux_x86_64.tar.gz")
sha256sums=('e614ab9e5c1af5f028ee18b6cc2aa1b46b01e157fdf01af5d29d5fa5bf73bc6d')

package() {
  install -Dm 0755 stripe "$pkgdir/usr/bin/stripe"
}
