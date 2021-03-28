# Maintainer: Daniel Duan <daniel@duan.ca>
pkgname=tre-command
pkgver=0.3.6
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Tree command, improved."
url="https://github.com/dduan/tre"
license=('MIT')

build() {
    return 0
}

package() {
    cd $srcdir
    cargo install --root="$pkgdir" --git=https://github.com/dduan/tre
}
