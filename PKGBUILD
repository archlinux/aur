# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Alfred Roos alfred@stensatter.se
pkgname=tetriser-git
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="Tetris clone in terminal colorzied"
arch=(x86_64)
url="https://github.com/spynetS/ctris"
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
source=(https://github.com/spynetS/ctris.git)
noextract=()
md5sums=()
validpgpkeys=()

prepare() {
    git clone https://github.com/spynetS/ctris.git ctris
}

build() {
    cd ctris
    gcc ./src/main.c
}

package() {
    cd ctris
    install -Dm755 ./a.out "$pkgdir/usr/bin/ctris"
    # export lctr=/user/bin/lctr
}
