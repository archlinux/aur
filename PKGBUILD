# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.43.8
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
b2sums_x86_64=('a706daed93ae27382446a72b9034301d1da816b7e59995fafd0ff8f57f0bdf524c4d72c1ce20d7a2925c2c45cc028ec34d19d47fdaf52e20eed5211a92ec45e7')
b2sums_aarch64=('fb09fd3b633dd8a3084c4b838f3e6e5bf1bb6f953d7744065b827906076f3400057c2fcda3dde62179dd8435a8944fcae7a83c4f1a124ab4667629cd4f4cecb9')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
