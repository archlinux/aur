# Maintainer: IGI-111 <igi.222@gmail.com>
pkgname=smith
pkgver=2.0.0
pkgrel=1
pkgdesc="Smith is a simple terminal-based text editor written in Rust."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/IGI-111/Smith"
license=('MIT')
makedepends=('cargo')

build() {
    return 0
}

package() {
    cd $srcdir
    cargo install --root="$pkgdir/usr" "$pkgname"
}
