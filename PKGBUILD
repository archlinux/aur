# Maintainer: LitiaEeloo <litiaeeloo@gmail.com>

pkgname=blooming-blockery-bin
pkgver=0.0.4
pkgrel=1
pkgdesc="A structured document editor for designers and developers."
url="https://github.com/photonfoxlime/bb"
license=("Apache-2.0")
arch=("x86_64")
provides=("blooming-blockery")
conflicts=("blooming-blockery")
source=("https://github.com/photonfoxlime/bb/releases/download/v$pkgver/blooming-blockery-x86_64-unknown-linux-gnu.tar.xz")
sha256sums=("c4d144dec990aafaf29119da9abb27864d1235028e7187afe65e54d0d40de393")

package() {
    install -Dm755 blooming-blockery-x86_64-unknown-linux-gnu/blooming-blockery -t "$pkgdir/usr/bin"
    install -Dm644 blooming-blockery-x86_64-unknown-linux-gnu/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
