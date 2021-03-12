# Maintainer: Jonny Stoten <jonny@jonnystoten.com>

pkgname=stripe-cli-bin
pkgver=1.5.10
pkgrel=1
pkgdesc="A command-line tool for Stripe"
arch=("x86_64")
url="https://stripe.com/docs/stripe-cli"
license=("Apache")
depends=()
provides=()
conflicts=(stripe-cli)
source=("https://github.com/stripe/stripe-cli/releases/download/v$pkgver/stripe_${pkgver}_linux_x86_64.tar.gz")
sha256sums=('4c51c3b2a4d7a9fcbd2c68e969e36f0ff506f9f3e5ffebcbd1e2681d82e3088f')

package() {
  install -Dm 0755 stripe "$pkgdir/usr/bin/stripe"
}
