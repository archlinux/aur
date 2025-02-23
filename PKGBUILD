# Maintainer: Alireza S.N. <alireza6677 at gmail dot com>

pkgname=pmtiles
pkgver=1.25.2
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
b2sums=('95c24dbd00c42a415dafa613fb3524a92d96cc7e66b8e4d549c219ae32df7fa48a9ff6feb48f0d3529bbe5b251a76088aa7229e4c1c07d9a2206c4992d11b4de')

package() {
    install -d "${pkgdir}"/usr/bin
    mv pmtiles "${pkgdir}"/usr/bin

    install -dm755 "${pkgdir}"/usr/share/licenses
    install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/$pkgbase/
}
