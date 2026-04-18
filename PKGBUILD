# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.40.6
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
b2sums_x86_64=('dfe2842b67d0ec962f59032295d48ed752594b71a86268b186e99ee5e5bd2b5384ec57645ef8e53c37c95dd81df06ee509dff40a55a8129e5f9809a72d85c5f8')
b2sums_aarch64=('6e677c8d993e9d34b75f601c358e9b18534a0b6b436191cf2472aa72a915f844a552a5aba10621d7f94ce49fd31e90e160b640940e9ad448803f28924eefbbe0')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
