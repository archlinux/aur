# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.50.8
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
b2sums_x86_64=('a3dbaa7faf957789965c2d4a1d234a921db1e852c3766b9a986c24bd7fa28a8751ef07e6096f89ee57656d585eb04998ddd90aafdc876c926af008f2115b3d2b')
b2sums_aarch64=('37f4c55ebc03e3ba614ea27537a03dddba64672ac2fd0a74baee5c87263fdf1bc84ceea1f3a052eff67dd48e2b5684ab2db8d676551fe0b6dcad52aba5582790')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
