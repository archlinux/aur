# Maintainer: Jonny Stoten <jonny@jonnystoten.com>

pkgname=stripe-cli-bin
pkgver=1.9.0
pkgrel=1
pkgdesc="A command-line tool for Stripe"
arch=("x86_64")
url="https://stripe.com/docs/stripe-cli"
license=("Apache")
depends=()
provides=()
conflicts=(stripe-cli)
source=("https://github.com/stripe/stripe-cli/releases/download/v$pkgver/stripe_${pkgver}_linux_x86_64.tar.gz")
sha256sums=('7978b7e08318b83ea1bc8da3a62109fa75acb111eec0713785c1897b897496fb')

package() {
  install -Dm 0755 stripe "$pkgdir/usr/bin/stripe"
}
