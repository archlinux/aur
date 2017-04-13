# Maintainer: hashhar <hashhar_dev AT outlook DOT com>
# Contributor: ajs124 < aur AT ajs124 DOT de >
# Contributor: Daenyth <Daenyth+arch@gmail.com>

pkgname=fortune-mod-firefly
pkgver=3.0.0
pkgrel=3
pkgdesc="Fortune cookies from Joss Whedon's Firefly series."
license=('custom:cc-sa-3.0')
arch=('any')
url="https://en.wikiquote.org/wiki/Firefly_(TV_series)"
depends=('fortune-mod')
makedepends=('curl')
source=("https://hashhar.github.io/blobs/fortune-mod-firefly.tar.gz")
sha256sums=('a4bfdc78216dd8187ee001d90430162c7bbbe94bcba7f2575f55d131cb4b3801')

package() {
    cd "${srcdir}/${pkgname}"
    install -dm755 -- "${pkgdir}/usr/share/fortune"
    install -m644 -- firefly firefly.dat "${pkgdir}/usr/share/fortune"
}
