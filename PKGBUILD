# Maintainer: Jonny Stoten <jonny@jonnystoten.com>

pkgname=stripe-cli-bin
pkgver=1.8.9
pkgrel=1
pkgdesc="A command-line tool for Stripe"
arch=("x86_64")
url="https://stripe.com/docs/stripe-cli"
license=("Apache")
depends=()
provides=()
conflicts=(stripe-cli)
source=("https://github.com/stripe/stripe-cli/releases/download/v$pkgver/stripe_${pkgver}_linux_x86_64.tar.gz")
sha256sums=('66fd6b1a6aa3eae3eca31f51ce77b579c88bdcc9cd317e7cd235c7500cb6acfe')

package() {
  install -Dm 0755 stripe "$pkgdir/usr/bin/stripe"
}
