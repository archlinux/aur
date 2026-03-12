# Maintainer: LitiaEeloo <litiaeeloo@gmail.com>

pkgname=blooming-blockery-bin
pkgver=0.0.27
pkgrel=2
pkgdesc="A structured document editor for designers and developers."
url="https://github.com/photonfoxlime/bb"
license=("Apache-2.0")
arch=("x86_64")
provides=("blooming-blockery")
conflicts=("blooming-blockery")
source=("blooming-blockery-${pkgver}-x86_64-unknown-linux-gnu.tar.xz::https://github.com/photonfoxlime/bb/releases/download/v0.0.27/blooming-blockery-x86_64-unknown-linux-gnu.tar.xz")
sha256sums=('77851b38b89a8a921b9149425353da2945c32770502ff6a07adcab61e4deba30')

package() {
    install -Dm755 blooming-blockery-${pkgver}-x86_64-unknown-linux-gnu/blooming-blockery -t "$pkgdir/usr/bin"
    install -Dm644 blooming-blockery-${pkgver}-x86_64-unknown-linux-gnu/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
