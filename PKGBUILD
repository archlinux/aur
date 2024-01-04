# Maintainer: Jonny Stoten <jonny@jonnystoten.com>

pkgname=stripe-cli-bin
pkgver=1.19.1
pkgrel=1
pkgdesc="A command-line tool for Stripe"
arch=("x86_64")
url="https://stripe.com/docs/stripe-cli"
license=("Apache")
depends=()
provides=()
conflicts=(stripe-cli)
source=("https://github.com/stripe/stripe-cli/releases/download/v$pkgver/stripe_${pkgver}_linux_x86_64.tar.gz")
sha256sums=('963c83aa410a91a7bf38de6e4564acf5e94d8ba2dc41c7fcbf75bf55b59a77c6')

package() {
  install -Dm 0755 stripe "$pkgdir/usr/bin/stripe"
}
