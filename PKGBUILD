# Maintainer: James Forster <james.forsterer@gmail.com>

pkgname=metapac-bin
pkgver=0.2.4
pkgrel=1
pkgdesc="multi-backend declarative package manager"
url="https://github.com/ripytide/metapac"
license=("GPL-3.0-or-later")
arch=("x86_64")
provides=("metapac")
conflicts=("metapac")
source=("https://github.com/ripytide/metapac/releases/download/v$pkgver/metapac-x86_64-unknown-linux-gnu.tar.xz")
options=(!debug !lto)
sha256sums=('ff0fc461b31f0e193434800226d9bd2437db1acaf278adecf8520076c052867a')

package() {
    install -Dm755 metapac-x86_64-unknown-linux-gnu/metapac -t "$pkgdir/usr/bin"
}
