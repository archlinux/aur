# Maintainer: Shadowsith <philip.mayer@shadowsith.de>

pkgname=qpicospeaker-git
pkgver=git
pkgrel=1
pkgdesc='Qt GUI for the svox-pico text-to-speech engine'
arch=('i686' 'x86_64')
url='https://github.com/Shadowsith/qpicospeaker'
licence=('MIT')
depends=('sox' 'svox-pico-bin')
makedepends=(qt5-base)
optdepends=()
provides=('')
backup=("")
install=
source=("git+https://github.com/Shadowsith/qpicospeaker")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd build
}

build() {
    make
}

package() {
    make install
}

