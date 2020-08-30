# Maintainer: reujab <reujab@gmail.com>
pkgname=silver-git
pkgver=1.1.0
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="A cross-shell customizable powerline-like prompt with icons"
license=('MIT')

build() {
    return 0
}

package() {
    cd $srcdir
    cargo install --root="$pkgdir" --git=https://github.com/reujab/silver
}
