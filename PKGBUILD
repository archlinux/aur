# Maintainer: IRendy
# Fork of:  Philip Heron <phil@sanslogic.co.uk> — https://codeberg.org/fsphil/ssdv

pkgname=ssdv
pkgver=r58.d1ceda8
pkgrel=1
pkgdesc="Simple command line app for encoding/decoding SSDV (Slow Scan Digital Video) image data"
arch=('x86_64')
url="https://codeberg.org/IRendy/ssdv"
license=('GPL3')
options=(!debug)
depends=('glibc')
makedepends=('git' 'gcc')
source=("$pkgname::git+https://codeberg.org/IRendy/ssdv.git#commit=d1ceda81b69f88741396f3e052b50c8ae40efb76")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  make install DESTDIR="$pkgdir"
}
