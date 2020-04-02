# Maintainer: Jonny Stoten <jonny@jonnystoten.com>

pkgname=stripe-cli-bin
pkgver=1.3.9
pkgrel=1
pkgdesc="A command-line tool for Stripe"
arch=("x86_64")
url="https://stripe.com/docs/stripe-cli"
license=("Apache")
depends=()
provides=()
conflicts=(stripe-cli)
source=("https://github.com/stripe/stripe-cli/releases/download/v$pkgver/stripe_${pkgver}_linux_x86_64.tar.gz")
sha256sums=('111a38209282801316ab1951aa09aa92e877acadec0929a3c03495823c4341ea')

package() {
  install -Dm 0755 stripe "$pkgdir/usr/bin/stripe"
}
