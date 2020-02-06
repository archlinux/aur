# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="nominatim-data-postcodes-gb"
pkgdesc="Optional postcode (GB) data to use with nominatim"
url="https://nominatim.org"

pkgver=20191119
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
    "49e15831f7d88d2e02496f15a69a935281ddec5d6da79d3537b42f7fa9fd3170"
)
noextract=(
    "gb_postcode_data.sql.gz"
)

package() {
    install -Dm644 -t "${pkgdir}/usr/share/webapps/nominatim/data/" \
        "${srcdir}/gb_postcode_data.sql.gz"
}
