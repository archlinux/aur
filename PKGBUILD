# vim: ft=sh

# Maintainer: Lucas David Traverso <lucas6246@gmail.com>
pkgname=dottle
pkgver=0.2.1
pkgrel=1
pkgdesc="POSIX script to manage dotfiles"
arch=('any')
url="https://github.com/ludat/dottle/"
license=('MIT')
source=("https://github.com/ludat/dottle/releases/download/v${pkgver}/dottle")
md5sums=('8043ff5a59040cf3565ead7fc8ca616c')

package() {
    install -D -t "$pkgdir/usr/bin" "$srcdir/dottle"
}
