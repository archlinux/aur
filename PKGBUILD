# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="nominatim-data-postcodes-gb"
pkgdesc="Optional postcode (GB) data to use with nominatim"
url="https://nominatim.org"

pkgver=20200805
pkgrel=1

arch=("any")
license=("unknown")

depends=(
    "nominatim"
)

source=(
    "https://www.nominatim.org/data/gb_postcode_data.sql.gz"
)
sha256sums=(
    "7cbcf8f5c4b1acf0c538c6dd254491dd5cfdca2942eb45545cd2fe4a79c0331c"
)
noextract=(
    "gb_postcode_data.sql.gz"
)

package() {
    install -Dm644 -t "${pkgdir}/var/lib/nominatim/src/data/" \
        "${srcdir}/gb_postcode_data.sql.gz"
}
