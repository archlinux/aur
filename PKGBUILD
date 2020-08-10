# Maintainer: Colin Woodbury <colin@fosskers.ca>
pkgname=cargo-aur-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Prepare Rust projects to be released on the Arch Linux User Repository."
url="https://github.com/fosskers/cargo-aur"
license=("MIT")
arch=("x86_64")
provides=("cargo-aur")
options=("strip")
source=("https://github.com/fosskers/cargo-aur/releases/download/v$pkgver/cargo-aur-$pkgver-x86_64.tar.gz")
sha256sums=("6d52cfbf77e4ac11754691871944f72e753e2aa275e16eded40d24d0c1056ab9")

package() {
    install -Dm755 cargo-aur -t "$pkgdir/usr/bin/"
}
