# Maintainer: LitiaEeloo <litiaeeloo@gmail.com>

pkgname=blooming-blockery-bin
pkgver=0.0.17
pkgrel=1
pkgdesc="A structured document editor for designers and developers."
url="https://github.com/photonfoxlime/bb"
license=("Apache-2.0")
arch=("x86_64")
provides=("blooming-blockery")
conflicts=("blooming-blockery")
source=("https://github.com/photonfoxlime/bb/releases/download/v0.0.17/blooming-blockery-x86_64-unknown-linux-gnu.tar.xz")
sha256sums=('08407bfbfffab4e52454a96b2c0e3a4a65aaea3eaef2d1c8a244c60cbe6dfd33')

package() {
    install -Dm755 blooming-blockery-x86_64-unknown-linux-gnu/blooming-blockery -t "$pkgdir/usr/bin"
    install -Dm644 blooming-blockery-x86_64-unknown-linux-gnu/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
