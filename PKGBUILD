# Maintainer: <waruqi@gmail.com>
# PKGBuild Create By: lumpyzhu <lumpy.zhu@gmail.com>

pkgname=xmake
pkgver=2.6.9
pkgrel=1
pkgdesc="A cross-platform build utility based on Lua"
arch=('i686' 'x86_64')
url="https://github.com/xmake-io/xmake"
license=('Apache')
makedepends=('ncurses' 'readline')
source=("https://github.com/xmake-io/xmake/releases/download/v${pkgver}/xmake-v${pkgver}.tar.gz")
sha256sums=('68f2e7ef85db2841c707bb909ae4a5d058e8c1e4837c2a95b0bfefd56600ca83')

build() {
    cd "$srcdir"
    make build
}

package() {
    cd "$srcdir"
    make install DESTDIR="${pkgdir}" PREFIX="/usr"
}
