# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Alfred Roos alfred@stensatter.se
pkgname=ctrisr-git
pkgver=1.1.5
pkgrel=1
epoch=
pkgdesc="Tetris clone in terminal colorzied"
arch=(x86_64)
url="https://github.com/spynetS/ctrisr"
license=('GPL-2.0')
groups=()
depends=()
makedepends=(gcc)
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
    gcc ./src/main.c
}

package() {
    cd ctrisr
    install -Dm755 ./a.out "$pkgdir/usr/bin/ctrisr"
    # export lctr=/user/bin/lctr
}
