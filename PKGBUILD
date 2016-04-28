# vim: ft=sh

# Maintainer: Lucas David Traverso <lucas6246@gmail.com>
pkgname=dottle
pkgver=0.2.0
pkgrel=1
pkgdesc="POSIX script to manage dotfiles"
arch=('any')
url="https://github.com/ludat/dottle/"
license=('MIT')
source=("https://github.com/ludat/dottle/releases/download/v${pkgver}/dottle")
md5sums=('82c647a62bd657d351d53a66c85a51df')

package() {
    install -D -t "$pkgdir/usr/bin" "$srcdir/dottle"
}
