
# Maintainer: Alfred Roos alfred@stensatter.se
pkgname=ctrisr-git
pkgver=1.2.8
pkgrel=1
epoch=
pkgdesc="Tetris clone in terminal colorzied"
arch=(x86_64)
url="https://github.com/spynetS/ctrisr"
license=('GPL-2.0')
groups=()
depends=()
makedepends=(gcc tup)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=()
validpgpkeys=()

prepare() {
    git clone https://github.com/spynetS/ctrisr.git ctrisr
}

build() {
    cd ctrisr
    tup init && tup
}

package() {
    cd ctrisr
    install -Dm755 ./build/ctrisr "$pkgdir/usr/bin/ctrisr"
}
