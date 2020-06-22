# Maintainer: Colin Woodbury <colin@fosskers.ca>
pkgname=cargo-aur-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Prepare Rust projects to be released on the Arch Linux User Repository."
url="https://github.com/fosskers/cargo-aur"
license=("MIT")
arch=("x86_64")
provides=("cargo-aur")
options=("strip")
source=("https://github.com/fosskers/cargo-aur/releases/download/v$pkgver/cargo-aur-$pkgver-x86_64.tar.gz")
sha256sums=("6f4a92039a3ac38f77ee075be30d97cc1f012aa57d1071bfddb7ba16d266d3a9")

package() {
    install -Dm755 cargo-aur -t "$pkgdir/usr/bin/"
}
