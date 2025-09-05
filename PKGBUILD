# Maintainer: Alireza S.N. <alireza6677 at gmail dot com>

pkgname=pmtiles
pkgver=1.28.0
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
b2sums=('82c2bd51cd88ebdb09f3152ddf049393ec62ea314691528414ccc3cb288350da7ffdb17e54032f64f929bbe67f6afcd0897a4a965ada7beda91e205a72b73f91')

package() {
    install -d "${pkgdir}"/usr/bin
    mv pmtiles "${pkgdir}"/usr/bin

    install -dm755 "${pkgdir}"/usr/share/licenses
    install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/$pkgbase/
}
