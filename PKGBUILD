# Maintainer: IRendy
# Upstream: Philip Heron <phil@sanslogic.co.uk>

pkgname=ssdv
pkgver=r61.7f1ac41
pkgrel=1
pkgdesc="Simple command line app for encoding/decoding SSDV (Slow Scan Digital Video) image data"
arch=('x86_64')
url="https://codeberg.org/fsphil/ssdv"
license=('GPL3')
options=(!debug)
depends=('glibc')
makedepends=('git' 'gcc')
source=("$pkgname::git+https://codeberg.org/fsphil/ssdv.git#commit=7f1ac41a7cbe3c54c61818816b85264b8b2c0065")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  make install DESTDIR="$pkgdir"
}
