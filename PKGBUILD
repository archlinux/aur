# Maintainer: Jonny Stoten <jonny@jonnystoten.com>

pkgname=stripe-cli-bin
pkgver=1.2.6
pkgrel=1
pkgdesc="A command-line tool for Stripe"
arch=("x86_64")
url="https://stripe.com/docs/stripe-cli"
license=("Apache")
depends=()
provides=()
conflicts=(stripe-cli)
source=("https://github.com/stripe/stripe-cli/releases/download/v$pkgver/stripe_${pkgver}_linux_x86_64.tar.gz")
sha256sums=('e32713f9a6f83e88dd26c0a58e81c5913380d5dbd5a16c30688b3ddc2c5f68aa')

package() {
  install -Dm 0755 stripe "$pkgdir/usr/bin/stripe"
}
