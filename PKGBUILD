# Maintainer: Colin Woodbury <colin@fosskers.ca>
pkgname=cargo-aur-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Prepare Rust projects to be released on the Arch Linux User Repository."
url="https://github.com/fosskers/cargo-aur"
license=('MIT')
arch=('x86_64')
provides=('cargo-aur')
options=('strip')
source=(https://github.com/fosskers/cargo-aur/releases/download/v$pkgver/cargo-aur-$pkgver-x86_64.tar.gz)
md5sums=('7156fe01a99f7e66bb5bdb97dfccbfb6')

package() {
    mkdir -p "$pkgdir/usr/bin/"
    install -m 755 cargo-aur "$pkgdir/usr/bin/"
}
