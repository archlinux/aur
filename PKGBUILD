pkgname=lighthouse-ethereum-bin
_pkgname=lighthouse
pkgver=2.0.1
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
sha256sums=('6177783233fa1a63c674d07c161454b4ecbd5e1c4bc8a4ee51399828ff70f3a6')

package() {
    install -D -m755 "$srcdir/lighthouse" "$pkgdir/usr/bin/lighthouse"
}
