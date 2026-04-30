# Maintainer: Alireza S.N. <alireza6677 at gmail dot com>

pkgname=pmtiles
pkgver=1.30.2
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
b2sums=('875f0ee8f447540d646df55437fe0fe6db03f9cec425c8ff0a56f835d36518a0a78a3a42318d1477c32cffae54178b948a0e882f04fa8317bfa8e3a2c09e52da')

package() {
    install -d "${pkgdir}"/usr/bin
    mv pmtiles "${pkgdir}"/usr/bin

    install -dm755 "${pkgdir}"/usr/share/licenses
    install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/$pkgbase/
}
