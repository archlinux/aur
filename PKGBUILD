pkgname=lighthouse-ethereum-bin
_pkgname=lighthouse
pkgver=2.5.0
pkgrel=1
pkgdesc='Ethereum 2.0 client'
arch=('x86_64' 'aarch64')
url='https://lighthouse.sigmaprime.io/'
license=('Apache License 2.0')
depends=('openssl')
provides=('lighthouse')
conflicts=('lighthouse')
replaces=('lighthouse')
source=("https://raw.githubusercontent.com/sigp/lighthouse/stable/LICENSE")
source_x86_64=("https://github.com/sigp/lighthouse/releases/download/v${pkgver}/lighthouse-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/sigp/lighthouse/releases/download/v${pkgver}/lighthouse-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('91d7b651aa6c6ffe6c36445f2652b49ff86134f6dc558a8bf35a8d407dfe2578')
sha256sums_x86_64=('cfe4d65d5d4845fefdd91cd314fd949d9bcc3de45a7eb0bdbe7c57ecfdea1c75')
sha256sums_aarch64=('8acb11269f73d46998c992a67e8fb89ed7347038ea52c267949fb97df2e9f8dd')
sha256sums=('91d7b651aa6c6ffe6c36445f2652b49ff86134f6dc558a8bf35a8d407dfe2578')
sha256sums_x86_64=('e65a4524215956ec4370376d9a88ccf2f17bf1d869d1752e9fffa117dfc40d21')
sha256sums_aarch64=('3c423c2511a16574dc66ea93007b7eb3ec299b9303dcb5f4698f08c10c1399d8')

package() {
    install -D -m755 "$srcdir/lighthouse" "$pkgdir/usr/bin/lighthouse"
    install -D -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
