# Maintainer: Colin Woodbury <colin@fosskers.ca>
pkgname=cargo-aur-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Prepare Rust projects to be released on the Arch Linux User Repository."
url="https://github.com/fosskers/cargo-aur"
license=('MIT')
arch=('x86_64')
provides=('cargo-aur')
options=('strip')
source=("https://github.com/fosskers/cargo-aur/releases/download/v$pkgver/cargo-aur-$pkgver-x86_64.tar.gz")
sha256sums=('1e4789b2e50413f495768f2f9c68b280c43f6d457b9a7ac222cf268d63e5462b')

package() {
    install -Dm755 cargo-aur -t "$pkgdir/usr/bin/"
}
