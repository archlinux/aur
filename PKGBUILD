pkgname=lighthouse-ethereum-bin
pkgver=1.2.0
_pkgname=lighthouse
pkgrel=1
pkgdesc='Ethereum 2.0 client'
arch=('x86_64')
url='https://lighthouse.sigmaprime.io/'
license=('Apache License 2.0')
depends=('openssl')
provides=('lighthouse')
conflicts=('lighthouse')
replaces=('lighthouse')
source=("https://github.com/sigp/lighthouse/releases/download/v${pkgver}/lighthouse-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('8ad58587003134562096dc6253b9295da868a1987349e8d7ee19a3fb0edab14e')

package() {
    install -D -m755 "$srcdir/lighthouse" "$pkgdir/usr/bin/lighthouse"
}
