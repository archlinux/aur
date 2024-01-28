# Maintainer: Nebagibuappu Rust <nebagibuappurust@gmail.com>
pkgname=calciluator
pkgver=0.1.0
pkgrel=1
url="https://github.com/Nebagibuappu/calc"
license=('unknown')
pkgdesc="Calculator"
depends=("gcc-libs" "glibc")
makedepends=('git' 'rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("git+https://github.com/Nebagibuappu/calc.git")
md5sums=('SKIP')

build() {
    return 0
}

package() {
    cd $srcdir
    cargo install --path calc --root $pkgdir/usr/
}
