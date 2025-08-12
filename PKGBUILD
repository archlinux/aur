# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jonny Stoten <jonny@jonnystoten.com>

pkgname="stripe-cli-bin"
pkgver=1.29.0
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
b2sums_x86_64=('e790efd85d9e0a299b797922a435ae1652a368ac1d9bdb39af43e8736a2c4df3316e290fd32683ee3e4a8de0040846d048b7389cdb6d8ac38ae289352445c96b')
b2sums_aarch64=('67fd37f4b4c7412b782fd98edbb0a9a34d1f7cd2b0f2504fc608131c1baec3dacde82793899027883c6a34f36c690cba2c092cc550a256ec896404169ea8934c')

package() {
 install -D -m 0755 "stripe" "$pkgdir/usr/bin/stripe"
}
