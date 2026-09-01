# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=firm-bin
pkgver=0.5.0
pkgrel=2
pkgdesc='Text-based work management system for technologists'
arch=('x86_64' 'aarch64')
url='https://github.com/42futures/firm'
license=('AGPL-3.0-or-later')
provides=('firm')
conflicts=('firm')
source=("${pkgname}-${pkgver}.LICENSE::${url}/raw/main/LICENSE")
source_x86_64=("${pkgname}-x86_64-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/firm-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-aarch64-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/firm-linux-arm64.tar.gz")
sha256sums=('8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef')
sha256sums_x86_64=('2ef50f7bcc16916feef2e16391a0d07ddf52e6664d79191ed5827a1db3fa8caa')
sha256sums_aarch64=('59df8036fbefa2c033a60bdc55a732f30df3ff5cf77688b3195b5396702ea6ac')

package() {
    install -Dm755 firm "$pkgdir/usr/bin/firm"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "${pkgname}-${pkgver}.LICENSE" \
        -t "$pkgdir/usr/share/licenses/$pkgname/"
}
