# Maintainer: Ali Riza Keskin <aliriza.keskin@pardus.org.tr>
pkgname="pardus-lightdm-greeter"
pkgver="master"
pkgrel=1
pkgdesc="A customizable lightdm greeter for Pardus GNU/Linux."
arch=("any")
url="https://github.com/pardus/pardus-lightdm-greeter"
license=(GPL3)
makedepends=("make")
source=("https://github.com/pardus/pardus-lightdm-greeter/archive/refs/heads/master.zip")
md5sums=("SKIP")

depends=(
    python-gobject
    python-cairo
    python-xlib
    gtk3
    lightdm
)

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="${pkgdir}"
}