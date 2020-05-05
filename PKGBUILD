pkgname=scantailor-advanced-bin
pkgver=v1.0.16.r119
pkgrel=1
pkgdesc="Interactive post-processing tool for scanned pages that merges the features of the ScanTailor Featured and ScanTailor Enhanced versions, brings new ones and fixes. "
arch=("x86_64")
url="https://github.com/4lex4/scantailor-advanced"
license=("GPL3")
depends=(
    "boost-libs"
    "libjpeg"
    "libpng"
    "libtiff"
    "qt5-base"
    "zlib"
    )
makedepends=()
provides=("scantailor-advanced")
conflicts=("scantailor-advanced-git")
source=("https://f002.backblazeb2.com/file/AUR-Store/$pkgname/scantailor-advanced-git-$pkgver.x86_64.tar.xz")
sha256sums=('1d8590cc2a35b13260d378bcb87fe136d00d2425ad2a945d2200a02d7328206b')

package() {
  cd $srcdir
  cp -dpr --no-preserve=ownership usr/ "$pkgdir/usr/"
}
