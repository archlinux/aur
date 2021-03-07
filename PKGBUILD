# Maintainer: Woomy4680-exe <github@woomy.ovh>
pkgname=kelpdot-bin
pkgver=2.0.3
pkgrel=1
pkgdesc="Simple dotfiles manager"
url="https://woomy4680-exe.github.io/kelp-docs/"
license=("MIT")
arch=("x86_64")
provides=("kelpdot")
options=("strip")
source=("https://github.com/Woomy4680-exe/kelp/releases/download/$pkgver/kelpdot-$pkgver-x86_64.tar.gz")
sha256sums=("1bbe4c96976a4864f03c1b47c3d071a4d4080ca940e4726326c7f33645602260")

package() {
    install -Dm755 kelpdot -t "$pkgdir/usr/bin/"
}
