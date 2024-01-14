# Maintainer: dreieck

# PKGBUILD last time manually edited: At least on 2024-01-14.

_year='24'
_fullyear="20${_year}"

_pkgname="idos-timetable-data-chaps-trains-odis"
pkgname="${_pkgname}"
epoch=0
pkgver="${_fullyear}"
pkgrel=1
pkgdesc="Metapackage designed to depend on the latest ${_pkgname} data package."
arch=(any)
url="https://chaps.cz/eng/download/idos/zip#kotvatt"
# url="https://chaps.cz/eng/download/idos-new/zip#kotvatt" # URL valid for the time when the timetable is still in the future.
license=('custom: public domain')

groups=(
        "idos-timetable"
       )

depends=(
         "${_pkgname}-${_fullyear}"
        )

makedepends=()
optdepends=()
provides=()
replaces=()
conflicts=()

source=(
  "license-metapackage-pd.txt"
)

sha256sums=(
  "1e86f8ac1ad7315c76f4db8bf6a1dbdde6825ac95ff468e431bbe452b6865ae6"
)

package() {
  install -D -m644 "${srcdir}/license-metapackage-pd.txt" "${pkgdir}/usr/share/licenses/${pkgname}/copying.txt"
}
