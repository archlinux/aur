# Maintainer: <waruqi@gmail.com>
# PKGBuild Create By: lumpyzhu <lumpy.zhu@gmail.com>

pkgname=xmake
pkgver=2.7.4
pkgrel=2
pkgdesc="A cross-platform build utility based on Lua"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/xmake-io/xmake"
license=('Apache')
makedepends=('ncurses' 'readline')
source=("https://github.com/xmake-io/xmake/releases/download/v${pkgver}/xmake-v${pkgver}.tar.gz")
sha256sums=('d490ff8825fa53fe5abfb549310cb54a2dfef1ebd3f82e24548483772994e06a')

build() {
    cd "$srcdir"
    ./configure
    make
}

package() {
    cd "$srcdir"
    make install PREFIX="${pkgdir}/usr"
}
