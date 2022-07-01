# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: z3oxs <z3ox1s@protonmail.com>
pkgname=dl
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc=""
arch=(x86_64 i686)
url="https://github.com/z3oxs/dl.git"
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
    cd "$srcdir/dl/cli/"
    go build .
}

package() {
    cd "$srcdir/dl/cli/"
    install -Dm755 dl "${pkgdir}/usr/bin/dl"
}
