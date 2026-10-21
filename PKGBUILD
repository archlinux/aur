# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.55.0
pkgrel=1
pkgdesc="A command-line tool for Stripe"
arch=("x86_64" "aarch64")
url="https://stripe.com/docs/stripe-cli"
license=("Apache-2.0")
depends=("ca-certificates")
optdepends=(
  "git: Git configuration and editor integration"
  "less: preferred interactive documentation pager"
  "xdg-utils: opening browser-based login and dashboard URLs"
)
provides=("stripe" "stripe-cli")
conflicts=("stripe-cli")
source_x86_64=("https://github.com/stripe/stripe-cli/releases/download/v$pkgver/stripe_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("https://github.com/stripe/stripe-cli/releases/download/v$pkgver/stripe_${pkgver}_linux_arm64.tar.gz")
b2sums_x86_64=('bd04448b9bc3438eb0f3034ab4f47c68da9bc44c6347bb6ad3be0ebcde61350b136dc82336a04f50c24f2ce44abd9cfd939bcd82999536a09314e3635b5d1a5e')
b2sums_aarch64=('d83a1e7c87a87bf316e31ec39f7c9e94d24fbca509a87f72cb6632eabaec53b54e532e73eae065b7ab6ae75d27330336c24033e6b9c65c6894dc356666fb7367')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
