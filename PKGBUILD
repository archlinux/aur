# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.35.1
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
b2sums_x86_64=('3da54f982871cecb0cc416c9347e878802dffe91c75950630f218afbfcff7551060fb90bfeddb3dfd60ed0124476f816092c8005712ddbb23eb993d2f6d3b281')
b2sums_aarch64=('8b705ea354bfe0f463570b4998331fc1d5daf1f5eaf3b5946d3a2550fc94708e725662c308ffe6d36401471712c12f7b5cb6a246c0835b7c2d050e52e106f86a')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
