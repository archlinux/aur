# Maintainer: James Forster <james.forsterer@gmail.com>

pkgname=metapac-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="multi-backend declarative package manager"
url="https://github.com/ripytide/metapac"
license=("GPL-3.0-or-later")
arch=("x86_64")
provides=("metapac")
conflicts=("metapac")
source=("https://github.com/ripytide/metapac/releases/download/v$pkgver/metapac-x86_64-unknown-linux-gnu.tar.xz")
options=(!debug !lto)
sha256sums=('2f47cd4d48ccbf3115ec17ce671635a290d16552d7e4c1408a3b675b8faf9dbe')

package() {
    install -Dm755 metapac-x86_64-unknown-linux-gnu/metapac -t "$pkgdir/usr/bin"
}
