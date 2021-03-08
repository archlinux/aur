# Maintainer: Woomy4680-exe <github@woomy.ovh>
pkgname=kelpdot-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Simple dotfiles manager"
url="https://woomy4680-exe.github.io/kelp-docs/"
license=("MIT")
arch=("x86_64")
provides=("kelpdot")
options=("strip")
source=("https://github.com/Woomy4680-exe/kelp/releases/download/v$pkgver/kelpdot-$pkgver-x86_64.tar.gz")
sha256sums=("3cbec1df748d42469a4439b2e1ebada0edb3b19d686fbd84ab1647efcd64045d")

package() {
    install -Dm755 kelpdot -t "$pkgdir/usr/bin/"
}
