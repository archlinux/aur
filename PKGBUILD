# Maintainer: James Forster <james.forsterer@gmail.com>

pkgname=metapac-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="multi-backend declarative package manager"
url="https://github.com/ripytide/metapac"
license=("GPL-3.0-or-later")
arch=("x86_64")
provides=("metapac")
conflicts=("metapac")
source=("https://github.com/ripytide/metapac/releases/download/v$pkgver/metapac-x86_64-unknown-linux-gnu.tar.xz")
options=(!debug !lto)
sha256sums=('b909df5ff30f8353b5ea5b56bcaff702eb18b10fcf9a281380da059b6917d253')

package() {
    install -Dm755 metapac-x86_64-unknown-linux-gnu/metapac -t "$pkgdir/usr/bin"
}
