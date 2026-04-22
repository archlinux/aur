# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.40.7
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
b2sums_x86_64=('51c035527db5701dc5da60c3344ba71e904585f671c3c482cf79467967a0ea0285bad0653cc857a9216d72f6e60dfb83780f8dc3bbba177c9302c071172280a1')
b2sums_aarch64=('bf3621ac95945e9cde9f989f1fed5519db840f9bbef6b9fd8219dc45f56438cfa2a28855da3e8abc84a55df2cc6606af1ee4a747445b345b54ed990c663fffee')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
