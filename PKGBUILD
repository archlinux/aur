# Maintainer: Obscurely <adrian.obscurely@protonmail.com>
pkgname=estash-bin
pkgver=0.5.1
pkgrel=1
epoch=
pkgdesc="An open source, cross-platform, programmed in rust, encrypted digital vault (store files and text) with the capability to set a path and with the click of a button to copy the contents to that file."
arch=('x86_64')
url="https://github.com/Obscurely/EStash"
license=('GPL3')
provides=('estash-bin')
conflicts=('estash' 'estash-git')
source=("https://github.com/Obscurely/EStash/releases/download/v${pkgver}-stable/estash-linux.tar.gz")
sha256sums=("a1aa3a4ef73b14034600d42c7bb73b2c9cccf9bff8fe39bfdb90b6312416353c")

package() {
    cd "$srcdir/"

    install -Dm755 estash -t "${pkgdir}/usr/bin/"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname%-bin}/"
}
