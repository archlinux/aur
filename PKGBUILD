pkgname=lighthouse-ethereum-bin
_pkgname=lighthouse
pkgver=2.2.0
pkgrel=1
pkgdesc='Ethereum 2.0 client'
arch=('x86_64' 'aarch64')
url='https://lighthouse.sigmaprime.io/'
license=('Apache License 2.0')
depends=('openssl')
provides=('lighthouse')
conflicts=('lighthouse')
replaces=('lighthouse')
source_x86_64=("https://github.com/sigp/lighthouse/releases/download/v${pkgver}/lighthouse-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/sigp/lighthouse/releases/download/v${pkgver}/lighthouse-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('a9efc4d910c06eded0556d1e1948e5cc9ab0e6dc69fbe43213032899198acec2')
sha256sums_aarch64=('dbd92d148f012c348889c5a545b6308c648896e0f38e11868c9724050c1b39ca')

package() {
    install -D -m755 "$srcdir/lighthouse" "$pkgdir/usr/bin/lighthouse"
}
