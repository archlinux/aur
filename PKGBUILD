# Maintainer: LitiaEeloo <litiaeeloo@gmail.com>

pkgname=blooming-blockery-bin
pkgver=0.0.19
pkgrel=2
pkgdesc="A structured document editor for designers and developers."
url="https://github.com/photonfoxlime/bb"
license=("Apache-2.0")
arch=("x86_64")
provides=("blooming-blockery")
conflicts=("blooming-blockery")
source=("https://github.com/photonfoxlime/bb/releases/download/v0.0.19/blooming-blockery-x86_64-unknown-linux-gnu.tar.xz")
sha256sums=('d8ab7656894abff4d15770dc22ce9d11592b95a6bffedf793f121eb7462f5911')

package() {
    install -Dm755 blooming-blockery-x86_64-unknown-linux-gnu/blooming-blockery -t "$pkgdir/usr/bin"
    install -Dm644 blooming-blockery-x86_64-unknown-linux-gnu/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
