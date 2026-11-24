# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.55.15
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
b2sums_x86_64=('575eada1bd594100b7a1a75b60a80f6892ae71e5514009cc45c759064eb20e4f876c05077d006232d1f517616be638fa85f89ae61f0c1d448e1eafeb4b338c45')
b2sums_aarch64=('41e0a1b501a0bd8514a26f90841d7460935541e178e5fb14ecbdd2674de842f85db3c20591e4114c0d596efbe492207f09efaeadc3f7c0b39169224d9037febc')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
