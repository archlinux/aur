# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.42.15
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
b2sums_x86_64=('d073d7d4ba0d920354b967ac688b1ae0d655df7588fab89309a9f897f1539b6ef1f33920e2f78a959374e622ba4f964a12408299e7867f686bcc08f5d95418e9')
b2sums_aarch64=('ec2482d201a1f5935674851cc4cd2366f8242ec2e464f66bcf1767dbf2fb7abf7a8b44185489fa0c717aa24406afd67894bd6a30a65d72a041f3322373b8c65a')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
