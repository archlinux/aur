# Maintainer: baraclese at gmail dot com
pkgname=quakewatch
pkgver=1.0
pkgrel=1
pkgdesc="Lists the latest earthquakes on the command-line"
url="https://github.com/baraclese/quakewatch"
arch=('any')
license=('GPL3')
depends=(
    python
    python-requests
    python-tabulate
)
source=("https://github.com/baraclese/quakewatch/archive/v${pkgver}.tar.gz")
sha256sums=(ca1f56d9277a063bd0dd8f05e789dce858ffaf51afd31432fda68ac7ac02b2c3)

package() {
    cd "$pkgname-$pkgver"
    install -Dm 755 quakewatch "$pkgdir/usr/bin/quakewatch"
}
