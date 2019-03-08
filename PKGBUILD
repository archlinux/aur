# Maintainer: RoccoDev <roccodev.business@gmail.com>
pkgname=pj
pkgver=1.0.0
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="JSON parser and visualizer."
license=('GPL-3.0-or-later')

build() {
    return 0
}

package() {
    cd $srcdir
    cargo install --root="$pkgdir" --git=https://github.com/RoccoDev/pj.git
}
