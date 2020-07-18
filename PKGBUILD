# Maintainer: Colin Woodbury <colin@fosskers.ca>
pkgname=cargo-aur-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="Prepare Rust projects to be released on the Arch Linux User Repository."
url="https://github.com/fosskers/cargo-aur"
license=("MIT")
arch=("x86_64")
provides=("cargo-aur")
options=("strip")
source=("https://github.com/fosskers/cargo-aur/releases/download/v$pkgver/cargo-aur-$pkgver-x86_64.tar.gz")
sha256sums=("9563fbf1a5c6db6203dd583f93fb9e021497a014cb9b201d76140f47fba596cc")

package() {
    install -Dm755 cargo-aur -t "$pkgdir/usr/bin/"
}
