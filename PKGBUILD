# Maintainer: Rajter <rajterandrija@gmail.com>
pkgname=picket
pkgver=1.3
pkgrel=1
pkgdesc="Linux screen color picker with magnifier and custom user defined formats."
arch=('any')
url="https://github.com/rajter/Picket"
license=('MIT')
groups=()
makedepends=(
  'cmake'
)
depends=(
  'gtkmm3'
  'libx11'
)
source=("https://github.com/rajter/picket/archive/v${pkgver}.tar.gz")

build() {
	cd "${pkgname}-${pkgver}"
    mkdir cmake-build-release
    cd cmake-build-release
    cmake -DCMAKE_BUILD_TYPE=Release ..
	make
}

package() {
	cd "${pkgname}-${pkgver}/cmake-build-release"
    make DESTDIR="$pkgdir/" install
}
md5sums=('c8f792ce4a521e0ca16070f15343ec6c')
md5sums=('23a231a95acaa366e5bd7215ae22e28b')
md5sums=('23a231a95acaa366e5bd7215ae22e28b')
md5sums=('5a1a7b918f4ab08553a4ceef89195825')
