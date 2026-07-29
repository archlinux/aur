# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.44.1
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
b2sums_x86_64=('b1d61dd55b2a5485f12f98fa6496b5c3d07485bb6d82cead1daa43dbbbfb098cae4d7956160420e7e38dcf8593ac92bfe20cbf1ff1a435785fa1cdd9791217f8')
b2sums_aarch64=('7649d3b93f6957608955d663d69ba12af0fade4f2151ba131c85bbaa03de8ceaf85c5536d98eef3df2f76622c5f3d1cbc1182fc984a03a161e2e120d225bf2e4')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
