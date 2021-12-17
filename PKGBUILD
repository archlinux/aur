# Maintainer: <waruqi@gmail.com>
# PKGBuild Create By: lumpyzhu <lumpy.zhu@gmail.com>

pkgname=xmake
pkgver=2.6.2
pkgrel=1
pkgdesc="A cross-platform build utility based on Lua"
arch=('i686' 'x86_64')
url="https://github.com/xmake-io/xmake"
license=('Apache')
makedepends=()
source=("https://github.com/xmake-io/xmake/releases/download/v${pkgver}/xmake-v${pkgver}.tar.gz")
sha256sums=('845f4bb50e300f75ed819755702e586614945eddcc74bc1dcef38c5cc107cebf')

build() {
    cd "$srcdir"
    make build
}

package() {
    cd "$srcdir"
    make install DESTDIR="${pkgdir}" PREFIX="/usr"
}
