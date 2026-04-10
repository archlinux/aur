# Maintainer: Alireza S.N. <alireza6677 at gmail dot com>

pkgname=pmtiles
pkgver=1.30.1
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
b2sums=('beb8004097fca9285f6bfc83ab497c0debc39c33fe98f995d5845ef1d39e1d240de483a2578c163f951eeabc663a857708760322259ac7e7b302b6426409efc1')

package() {
    install -d "${pkgdir}"/usr/bin
    mv pmtiles "${pkgdir}"/usr/bin

    install -dm755 "${pkgdir}"/usr/share/licenses
    install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/$pkgbase/
}
