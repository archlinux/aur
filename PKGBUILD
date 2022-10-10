# Maintainer: <waruqi@gmail.com>
# PKGBuild Create By: lumpyzhu <lumpy.zhu@gmail.com>

pkgname=xmake
pkgver=2.7.2
pkgrel=1
pkgdesc="A cross-platform build utility based on Lua"
arch=('i686' 'x86_64')
url="https://github.com/xmake-io/xmake"
license=('Apache')
makedepends=('ncurses' 'readline')
source=("https://github.com/xmake-io/xmake/releases/download/v${pkgver}/xmake-v${pkgver}.tar.gz")
sha256sums=('2d1159fd8910cd532b09315cbf7e3c8943df57f2b22952174c8cd04ba0358a14')

build() {
    cd "$srcdir"
    make build
}

package() {
    cd "$srcdir"
    make install DESTDIR="${pkgdir}" PREFIX="/usr"
}
