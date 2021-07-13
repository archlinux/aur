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
sha256sums=("c24011005ac81831ef4350179fc95a8ff8c7829992e065071bbf2a4138d0205d")

package() {
    install -Dm755 kelpdot -t "$pkgdir/usr/bin/"
}
