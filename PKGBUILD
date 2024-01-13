# Maintainer: Comamoca <comamoca.dev@gmail.com>
pkgname=era-git
pkgver=0.1.3
pkgrel=1
epoch=
pkgdesc=" A rainy clock in your terminal."
arch=('x86_64')
url="https://github.com/kyoheiu/era"
license=('MIT')
groups=()
depends=()
if !(type 'deno' > /dev/null 2>&1); then
    makedepends=('deno')
fi
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("era::git+https://github.com/kyoheiu/era")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

build() {
    cd ./era
    make install
}

package() {
    install -Dm 755 ./era/era "${pkgdir}/usr/bin/era"
}
