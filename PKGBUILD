# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.25.0
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
b2sums_x86_64=('41e00cb4d8ea036fba4fdd1c168b49920f8d384f543212a8ee758a9044b7b71ff2694eb358ff3282f1ba3dde408b5ab0c9c10ab24a545031ceb3698080499efa')
b2sums_aarch64=('053aa585d7430f932611104b06b17a876b0a54281b8c21cc5fad5608825a2b696c5d174a36609dcf1c5c85a79482a01b04e9e7721e618e9eaa7afedec3aee1b3')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
