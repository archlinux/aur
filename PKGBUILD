# Maintaner: Daniel Playfair Cal <daniel.playfair.cal@gmail.com>

pkgname=gpmf-parser
pkgver=2.1.0
pkgrel=1
pkgdesc="Parser for GPMF formatted telemetry data used within GoPro cameras"
arch=(x86_64)
license=(APACHE)
url="https://github.com/gopro/gpmf-parser/"
depends=()
makedepends=()
optdepends=()
source=("gpmf-parser::git+https://github.com/gopro/gpmf-parser.git#tag=v2.1")
md5sums=('SKIP')

build() {
	cmake -B build -S gpmf-parser
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build --prefix /usr
}
