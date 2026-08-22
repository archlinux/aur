# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.50.4
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
b2sums_x86_64=('ebbce393b5ea4d91694371c2ded9c21c36abd19ed60175f978655dee118c1ebb9e8b378275e658156f1e48d9a3bea6fa390bc687a4b1b73d7391c989863455a9')
b2sums_aarch64=('33bc4bdb9accdaaaf7b81ec2f707ee6422480f0b2ec225fedcbafc5cefc1dadbe2e1768d0f043a7bf5e6bb3dc1b10f16af4175f8671756f1534336af79edb44e')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
