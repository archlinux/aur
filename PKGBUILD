# Maintainer: LitiaEeloo <litiaeeloo@gmail.com>

pkgname=blooming-blockery-bin
pkgver=0.0.24
pkgrel=1
pkgdesc="A structured document editor for designers and developers."
url="https://github.com/photonfoxlime/bb"
license=("Apache-2.0")
arch=("x86_64")
provides=("blooming-blockery")
conflicts=("blooming-blockery")
source=("https://github.com/photonfoxlime/bb/releases/download/v0.0.24/blooming-blockery-x86_64-unknown-linux-gnu.tar.xz")
sha256sums=('356ab8499aba7c779a8239fcc5fa441d044153607610f3bb8e213c4a15707ae8')

package() {
    install -Dm755 blooming-blockery-x86_64-unknown-linux-gnu/blooming-blockery -t "$pkgdir/usr/bin"
    install -Dm644 blooming-blockery-x86_64-unknown-linux-gnu/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
