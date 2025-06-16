# Maintainer: Luna Jernberg <lunajernberg@gnome.org>

_pkgname=gnome-printing
pkgname="${_pkgname}"
pkgver=0.2.0
pkgrel=1
pkgdesc="Using Printing Devices with GNU/Linux"
arch=('x86_64')
url="https://www.aamot.io//software/gnome-printing/"
license=()
depends=()
makedepends=()
provides=('SKIP')
backup=('SKIP')
conflicts=('SKIP')
optdepends=('SKIP')
source=(
  "http://www.aamotinnovation.com/software/gnome-printing/gnome-printing-0.2.0.tar.xz"
  
)
sha256sums=('94199fcc89af81033d2859f3e8531b67ec05014260fcb365fd7ccc48a5d8001c')

prepare() {
 cd "${_pkgname}-${pkgver}"
}

build() {
 cd "${_pkgname}-${pkgver}"
}

package() {
  cd "${srcdir}"
  tar -xf "${srcdir}/${pkgname}-${pkgver}.tar.xz" -C "${pkgdir}"
}
