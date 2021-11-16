# Maintainer: Humble Penguin a.k.a Shaharyar Ahmed <humblepenguinoffical@gmail.com>
pkgname=cell-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A minimal command line text editor developed using Rust"
url=""
license=("GNU")
arch=("x86_64")
provides=("cell")
conflicts=("cell")
source=("https://github.com/humblepengi/cell/releases/download/v$pkgver/cell-$pkgver-x86_64.tar.gz")
sha256sums=("c804feaeea3b32168dee46527f91fa8227c3fe64c65965d1ce9540f2b1b13fae")

package() {
    install -Dm755 cell -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
