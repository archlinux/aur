# Maintainer: Florian Moser <arch@famoser.ch>

pkgname=lokalise2
pkgrel=1
pkgver=2.6.3
pkgdesc="Lokalise CLI v2 for lokalise.com."
url="https://lokalise.com"
arch=('x86_64')
license=('custom:BSD-3')
install=''
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/lokalise/lokalise-cli-2-go/releases/download/v${pkgver}/lokalise2_linux_x86_64.tar.gz"
)
sha256sums=('4afd6cc36e0345c57865d64a35ca1ba8274623dc6c55ba61260425aa0c17e4d3')

package() {
    install -D -m 755 "${srcdir}/lokalise2" "${pkgdir}/usr/bin/lokalise2"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
