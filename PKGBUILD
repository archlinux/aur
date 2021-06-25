# Maintainer: Woomy4680-exe <github@woomy.ovh>
pkgname=kelpdot-bin
pkgver=2.1.6
pkgrel=1
pkgdesc="Simple dotfiles manager"
url="https://woomy4680-exe.github.io/kelp-docs/"
license=("MIT")
arch=("x86_64")
provides=("kelpdot")
options=("strip")
source=("https://github.com/Woomy4680-exe/kelp/releases/download/$pkgver/kelpdot-aur.tar.gz")
sha256sums=("2a7c5dcb23a334d18443494ce1afe812b5cdf2f49ecdfcf63ea4ddf5919e4a17")

package() {
    install -Dm755 kelpdot -t "$pkgdir/usr/bin/"
}
