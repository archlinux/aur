pkgname=lighthouse-ethereum-bin
pkgver=1.4.0
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
sha256sums=('889302437b7092bec2d53506ac2b5078da3f7ff06f38845f26f4269608c429ad')

package() {
    install -D -m755 "$srcdir/lighthouse" "$pkgdir/usr/bin/lighthouse"
}
