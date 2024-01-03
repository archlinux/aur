# Maintainer: Whidix

pkgname=mksusecd
pkgver=2.12
pkgrel=1.01
pkgdesc="Script to create a SUSE installation ISO image."
arch=(x86_64 aarch64)
url="https://github.com/openSUSE/mksusecd"
license=()
makedepends=(
  asciidoc
)
depends=(
  checkmedia
)
provides=("mksusecd=${pkgver}")
conflicts=(mksusecd)
source=(
 "git+https://github.com/openSUSE/mksusecd"
)
sha256sums=(
  SKIP
)

package() {
  cd mksusecd

  DESTDIR="$pkgdir" make install
}
