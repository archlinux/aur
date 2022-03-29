# Maintainer: Jonny Stoten <jonny@jonnystoten.com>

pkgname=stripe-cli-bin
pkgver=1.8.2
pkgrel=1
pkgdesc="A command-line tool for Stripe"
arch=("x86_64")
url="https://stripe.com/docs/stripe-cli"
license=("Apache")
depends=()
provides=()
conflicts=(stripe-cli)
source=("https://github.com/stripe/stripe-cli/releases/download/v$pkgver/stripe_${pkgver}_linux_x86_64.tar.gz")
sha256sums=('ffecd05a09753c8df3ecea868daac12482ee42653c0c0bb683ce246e11e6e37b')

package() {
  install -Dm 0755 stripe "$pkgdir/usr/bin/stripe"
}
