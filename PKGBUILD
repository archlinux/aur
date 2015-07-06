# Maintainer: Sindre Moen <sindrenm@gmail.com>
pkgname=node-build
pkgver=20150706
pkgrel=1
pkgdesc="Compile and install Node or io.js"
arch=("any")
url="https://github.com/sindrenm/node-build"
license=("MIT")
optdepends=("git")
source=($url/tarball/v$pkgver)
md5sums=("cca3290caff851ef0c146c1623e9942c")

build() {
    cd $srcdir

    tar -x --strip-components 1 -zf "v$pkgver"
}

package() {
    cd $srcdir

    PREFIX="$pkgdir/usr" ./install.sh
}
