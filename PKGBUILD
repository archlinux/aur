# Maintainer: Goxore <ggooxxoorree@gmail.com>
pkgname=gxrfetch-git
pkgver=0.8.1.r33.e53a27c
pkgrel=1
epoch=
pkgdesc="A simple and customizable fetch program written in rust."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/Goxore/gxrfetch"
license=('GPL-3.0')
groups=()
depends=()
makedepends=('rust' 'cargo')
checkdepends=()
optdepends=()
provides=(gxrfetch)
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

pkgver(){
    cd "${_pkgname}"
    printf "0.8.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    return 0
}

package() {
    cargo install --no-track --all-features --root "$pkgdir/usr/" gxrfetch
}
