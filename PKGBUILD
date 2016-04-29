# vim: ft=sh

# Maintainer: Lucas David Traverso <lucas6246@gmail.com>
pkgname=dottle
pkgver=0.2.2
pkgrel=1
pkgdesc="POSIX script to manage dotfiles"
arch=('any')
url="https://github.com/ludat/dottle/"
license=('MIT')
source=("https://github.com/ludat/dottle/releases/download/v${pkgver}/dottle")
md5sums=('8225f92a0534fc67eb43e7a4f48e7e6a')

package() {
    install -D -t "$pkgdir/usr/bin" "$srcdir/dottle"
}
