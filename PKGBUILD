# Maintainer: gamestime102 < >
pkgname=Hoahppu
pkgver=1.0
pkgrel=1
pkgdesc="Meme Russian roulette: if you lose your user folder it will be deleted, if the computer loses it will try to erase the operating system (SECURITY PIN ACTIVATED)"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://codeberg.org/gamestime102/Hoahppu"
license=('WTFPL')
depends=('glibc')
makedepends=('gcc')
source=("russianroulette.c")
sha256sums=('SKIP') 

build() {
    cd "$srcdir"
    gcc -O2 -o russianroulette russianroulette.c
}

package() {
    install -Dm755 "$srcdir/russianroulette" "$pkgdir/usr/bin/russianroulette"
}
