# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.55.6
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
b2sums_x86_64=('8a218ab8a827c00cad5128f5dc77f0d5e41424856ad6770165a7b0c959bbb013f144179655d65431880dd65a20a9bebb4b99b3514afa9093cdad19b6a3501c09')
b2sums_aarch64=('4e7a7fe531f75bb906260a2ac0888c94735bfc8291fd6d04de9fc8b5b0622d044a28107c59dff31f86eca1715437b5754c7d2754128ff98d50a9a194fb432855')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
