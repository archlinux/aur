# Maintainer: Colin Woodbury <colin@fosskers.ca>
pkgname=cargo-aur-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Prepare Rust projects to be released on the Arch Linux User Repository."
url="https://github.com/fosskers/cargo-aur"
license=("MIT")
arch=("x86_64")
provides=("cargo-aur")
options=("strip")
source=("https://github.com/fosskers/cargo-aur/releases/download/v$pkgver/cargo-aur-$pkgver-x86_64.tar.gz")
sha256sums=("5f703a27112cd3b299fa0ab00b6d5e03ef25ef93ef675d8aa8d15cef3ac52dce")

package() {
    install -Dm755 cargo-aur -t "$pkgdir/usr/bin/"
}
