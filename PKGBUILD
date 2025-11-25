# Maintainer: baraclese at gmail dot com
pkgname=quakewatch
pkgver=1.0.1
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
sha256sums=(0378364c52c6b481b5f7719936226eccf99cc1c766db347960685ab5175986a9)

package() {
    cd "$pkgname-$pkgver"
    install -Dm 755 quakewatch "$pkgdir/usr/bin/quakewatch"
}
