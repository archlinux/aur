pkgname=lighthouse-ethereum-bin
_pkgname=lighthouse
pkgver=2.1.4
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
sha256sums=('9eb89a69790132f2fb13f605c7c220a3021a89ae165eeccd0d34041922064456')

package() {
    install -D -m755 "$srcdir/lighthouse" "$pkgdir/usr/bin/lighthouse"
}
