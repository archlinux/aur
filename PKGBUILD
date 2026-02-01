# Maintainer: Your Name <your.email@example.com>
pkgname=leafmon
pkgver=1.0.0
pkgrel=1
pkgdesc="Lightweight terminal-based system monitor"
arch=('x86_64')
url="https://github.com/MridulSharma2552007/leafmon"
license=('custom')
depends=('ncurses')
makedepends=('gcc' 'make')
source=("git+https://github.com/MridulSharma2552007/leafmon.git")
sha256sums=('SKIP')

build() {
    cd "$pkgname"
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" install
}
