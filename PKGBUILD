# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="nominatim-data-tiger"
pkgdesc="Optional tiger housenumber (US) data to use with nominatim"
url="https://nominatim.org"

pkgver=2019
pkgrel=0

arch=("any")
license=("unknown")

depends=(
    "nominatim"
)

source=(
    "https://nominatim.org/data/tiger2019-nominatim-preprocessed.tar.gz"
)
sha256sums=(
    "86a9233a35a79819ad1c15ff4ac01dfd9ec2cdbdc2e3ce577195fe574573413b"
)
noextract=(
    "tiger2019-nominatim-preprocessed.tar.gz"
)

package() {
    install -Dm644 -t "${pkgdir}/var/lib/nominatim/src/data/" \
        "${srcdir}/tiger2019-nominatim-preprocessed.tar.gz"
}
