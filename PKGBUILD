# Maintainer: Rajter <rajterandrija@gmail.com>
pkgname=picket
pkgver=1.0
pkgrel=1
pkgdesc="Linux screen color picker with magnifier and custom user defined formats."
arch=('any')
url="https://github.com/rajter/Picket"
license=('MIT')
groups=()
depends=(
  'gtk3-classic'
  'gtkmm3'
)
source=("https://github.com/rajter/Picket/archive/v${pkgver}.tar.gz")

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	cd "${pkgname}-${pkgver}"	
    make DESTDIR="$pkgdir/" install
}
md5sums=('59d092339521f011277d5ed6c0c87e62')
