# Maintainer: James Forster <james.forsterer@gmail.com>

pkgname=metapac-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="multi-backend declarative package manager"
url="https://github.com/ripytide/metapac"
license=("GPL-3.0-or-later")
arch=("x86_64")
provides=("metapac")
conflicts=("metapac")
source=("https://github.com/ripytide/metapac/releases/download/v$pkgver/metapac-x86_64-unknown-linux-gnu.tar.xz")
options=(!debug !lto)
sha256sums=('31801268198a6992a7d23f261aae26dc79608b4af2123a18c39b523662c938f7')

package() {
    install -Dm755 metapac-x86_64-unknown-linux-gnu/metapac -t "$pkgdir/usr/bin"
}
