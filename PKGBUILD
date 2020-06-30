# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="nominatim-data-postcodes-gb"
pkgdesc="Optional postcode (GB) data to use with nominatim"
url="https://nominatim.org"

pkgver=20200602
pkgrel=0

arch=("any")
license=("unknown")

depends=(
    "nominatim"
)

source=(
    "https://www.nominatim.org/data/gb_postcode_data.sql.gz"
)
sha256sums=(
    "e6e45dfb2d9e99d6cb56b1b961b88dc3038e7b63d723f789b3dcee10ff109383"
)
noextract=(
    "gb_postcode_data.sql.gz"
)

package() {
    install -Dm644 -t "${pkgdir}/var/lib/nominatim/src/data/" \
        "${srcdir}/gb_postcode_data.sql.gz"
}
