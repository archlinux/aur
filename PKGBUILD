# Maintainer: Colin Woodbury <colin@fosskers.ca>
pkgname=cargo-aur-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Prepare Rust projects to be released on the Arch Linux User Repository."
url="https://github.com/fosskers/cargo-aur"
license=("MIT")
arch=("x86_64")
provides=("cargo-aur")
source=("https://github.com/fosskers/cargo-aur/releases/download/v$pkgver/cargo-aur-$pkgver-x86_64.tar.gz")
sha256sums=("9269d4bd6328f1082ef761c9a5a7163045b89ad3802d3b565395bd22dedc42c6")

package() {
    install -Dm755 cargo-aur -t "$pkgdir/usr/bin/"
}
