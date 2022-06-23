# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: z3oxs <z3ox1s@protonmail.com>
pkgname=ghost-git
pkgver=1.0.9.1
pkgrel=1
epoch=
pkgdesc=""
arch=(x86_64 i686)
url="https://github.com/z3oxs/ghost.git"
license=('GPL')
groups=()
depends=(go)
makedepends=(go)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
    cd "$srcdir/ghost"
    go build .
}

package() {
    cd "$srcdir/ghost"
    install -Dm755 ghost "${pkgdir}/usr/bin/ghost"
}
