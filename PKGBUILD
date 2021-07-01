#Maintainer: Daniel Lehmann <?>
pkgname=bomutils
pkgver=0.2
pkgrel=2
pkgdesc='Open source tools to create bill-of-materials files used in Mac OS X installers'
url='https://github.com/peek1e/bomutils'
arch=('x86_64')
license=('GPL2')
source=("$pkgname::git+https://github.com/PeeK1e/$pkgname")
makedepends=()
provides=('bomutils')
conflicts=('bomutils-git')
md5sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir" install
}

