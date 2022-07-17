# Maintainer: Marco Radocchia <marco.radocchia@outlook.com>
pkgname=qr-rs-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A CLI utility to encode URLs or text into QR codes in various formats and colors"
arch=('x86_64')
url="https://github.com/marcoradocchia/qr-rs"
license=('GPL3')
depends=()
provides=('qr')
conflicts=('qr')
source=("https://github.com/marcoradocchia/qr-rs/releases/download/v${pkgver}/qr-rs-${pkgver}-x86_64-linux-gnu.tar.gz")
sha256sums=("1adcd5b4734c78c854112837aa532be506b684d821e48539c0fcb3a0789d8474")

package() {
    cd "$srcdir/"
    # Install binary.
    install -Dm755 qr -t "${pkgdir}/usr/bin/"
}
