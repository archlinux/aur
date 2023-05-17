# Maintainer: dreieck

# PKGBUILD last time manually edited: At least on 2023-05-17.

_pkgname=idos-timetable-additionalinfo-chaps-all
pkgname="${_pkgname}"
epoch=0
_pkgver=1.0
pkgver="${_pkgver}"
pkgrel=6
pkgdesc="Metapackage depending on all the idos-timetable-additionalinfo-chaps-* additional information packages."
arch=('any')
url="http://chaps.cz/eng/download/idos/zip#kotvainf"
license=('custom')

groups=(
        "idos-timetable"
       )

depends=(
         "idos-timetable-additionalinfo-chaps-trains"
         "idos-timetable-additionalinfo-chaps-bus"
         "idos-timetable-additionalinfo-chaps-mhd-idsjmk"
         "idos-timetable-additionalinfo-chaps-mhd-odis"
         "idos-timetable-additionalinfo-chaps-mhd-pid"
        )

makedepends=()
optdepends=()
provides=()
conflicts=()

source=("copying.txt")

sha256sums=("7faf4c60d0975bd4892b41f0e70888880fb56abe3e7c0dac16f765aefbc32dd3")

pkgver() {
  echo "${_pkgver}"
}

package() {
  install -D -m644 "${srcdir}/copying.txt" "${pkgdir}/usr/share/licenses/${pkgname}/copying.txt"
}
