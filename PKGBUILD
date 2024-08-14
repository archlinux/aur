# Maintainer: Alireza S.N. <alireza6677 at gmail dot com>

pkgname=pmtiles
pkgver=1.20.0
pkgrel=1
pkgdesc="Single-file executable tool for working with PMTiles archives"
arch=("x86_64")
url="https://github.com/protomaps/go-pmtiles/"
license=("BSD-3-Clause")
depends=()
makedepends=()
provides=("pmtiles" "go-pmtiles")
conflicts=("pmtiles" "go-pmtiles")
source=("https://github.com/protomaps/go-pmtiles/releases/download/v${pkgver}/go-pmtiles_${pkgver}_Linux_${arch}.tar.gz")
b2sums=('a0747ca8dc6222e41db3d1d8986e63cfd2caa761b678cf3b3328089f8095671b69f128d568b0744da6a734cc30bca24106f1ee3c6370e2d4aa62cb02d9a1478a')

package() {
    install -d "${pkgdir}"/usr/bin
    mv pmtiles "${pkgdir}"/usr/bin

    install -dm755 "${pkgdir}"/usr/share/licenses
    install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/$pkgbase/
}
