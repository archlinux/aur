# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.37.2
pkgrel=1
pkgdesc="A command-line tool for Stripe"
arch=("x86_64" "aarch64")
url="https://stripe.com/docs/stripe-cli"
license=("Apache-2.0")
depends=()
provides=("stripe" "stripe-cli")
conflicts=("stripe-cli")
source_x86_64=("https://github.com/stripe/stripe-cli/releases/download/v$pkgver/stripe_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("https://github.com/stripe/stripe-cli/releases/download/v$pkgver/stripe_${pkgver}_linux_arm64.tar.gz")
b2sums_x86_64=('3ff2a648bc501e636ea1efd4ddd48a3973279380dad39cf564bdcb332f876f74fe0329dbfb9816c43e7d910ef1549e2bdb607741db7704153d11b31020aec676')
b2sums_aarch64=('8a5a702d13a0c21fd299be86ee35524b7bca27b7360664072622011be00216f34c4e7f95479e81fc0ea2a88dbb9c8e927a12f0da3dde63f93a44a959358daddd')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
