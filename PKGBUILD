# Maintainer: Woomy4680-exe <github@woomy.ovh>
pkgname=kelpdot-bin
pkgver=2.1.8
pkgrel=1
pkgdesc="Simple dotfiles manager"
url="https://woomy4680-exe.github.io/kelp-docs/"
license=("MIT")
arch=("x86_64")
provides=("kelpdot")
options=("strip")
source=("https://github.com/Woomy4680-exe/kelp/releases/download/$pkgver/kelpdot-aur.tar.gz")
sha256sums=("4ca09e269ce9a01991edccee6480720ac090b26a80b88694a0371cf7fd474e39")

package() {
    install -Dm755 kelpdot -t "$pkgdir/usr/bin/"
}
