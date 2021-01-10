# Maintainer: Tim van Leuverden <timmy1e at protonmail dot ch>

pkgname=ruri
pkgver=2.0.0
pkgrel=1
pkgdesc="Calculates the CRC-32 of a file and checks it against the filename."
arch=(any)
url="https://gitlab.com/Timmy1e/ruri"
license=(GPL3)

source=(
  "${pkgname}_${pkgver}::https://gitlab.com/Timmy1e/ruri/uploads/f6bd33f10be83001a241050842249c1d/ruri"
)

sha256sums=(
  'd5676ba63f5c2ef1f2ea7fa7f016149d19c9d78fc41332ff09cc7c7bd4336654'
)
            
package() {
  install -D -m755 "${srcdir}/${pkgname}_${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim: sw=2 ts=2 tw=80 et: