# Maintainer: Jonny Stoten <jonny@jonnystoten.com>

pkgname=stripe-cli-bin
pkgver=1.6.2
pkgrel=1
pkgdesc="A command-line tool for Stripe"
arch=("x86_64")
url="https://stripe.com/docs/stripe-cli"
license=("Apache")
depends=()
provides=()
conflicts=(stripe-cli)
source=("https://github.com/stripe/stripe-cli/releases/download/v$pkgver/stripe_${pkgver}_linux_x86_64.tar.gz")
sha256sums=('22af31a6e668eaf9fe9aac5b2495c9dd8cf747b348c4c78bb8f8599e7f9574f9')

package() {
  install -Dm 0755 stripe "$pkgdir/usr/bin/stripe"
}
