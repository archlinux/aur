# Maintainer: Jonny Stoten <jonny@jonnystoten.com>

pkgname=stripe-cli-bin
pkgver=1.5.6
pkgrel=1
pkgdesc="A command-line tool for Stripe"
arch=("x86_64")
url="https://stripe.com/docs/stripe-cli"
license=("Apache")
depends=()
provides=()
conflicts=(stripe-cli)
source=("https://github.com/stripe/stripe-cli/releases/download/v$pkgver/stripe_${pkgver}_linux_x86_64.tar.gz")
sha256sums=('b724b479e3075af860a8b22db7b695b9c762f67941697c6ad3cea3a322c59df0')

package() {
  install -Dm 0755 stripe "$pkgdir/usr/bin/stripe"
}
