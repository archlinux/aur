# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="nominatim-data-wikipedia"
pkgdesc="Optional Wikipedia data to use with nominatim"
url="https://nominatim.org"

pkgver=20191117
pkgrel=1

arch=("any")
license=("unknown")

depends=(
    "nominatim"
)

source=(
    "https://www.nominatim.org/data/wikimedia-importance.sql.gz"
)
sha256sums=(
    "895c5d12730a1d5a80eda8a27c12e7c00ab2f2b52d2c4c275d8b695f4ad647d3"
)

package() {
    install -Dm644 -t "${pkgdir}/var/lib/nominatim/src/data/" \
        "${srcdir}/wikimedia-importance.sql.gz"
}
