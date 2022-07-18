# Maintainer: Marco Radocchia <marco.radocchia@outlook.com>
pkgname=qr-rs-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="A CLI utility to encode URLs or text into QR codes in various formats and colors"
arch=('x86_64')
url="https://github.com/marcoradocchia/qr-rs"
license=('GPL3')
depends=()
provides=('qr')
conflicts=('qr')
source=("https://github.com/marcoradocchia/qr-rs/releases/download/v${pkgver}/qr-rs-${pkgver}-x86_64-linux-gnu.tar.gz")
sha256sums=("03ce5a1ed6623b22a069ad5d8a031c56ba49993462aa1afc2b2d4f7a46491186")

package() {
    cd "$srcdir/"
    # Install binary.
    install -Dm755 qr -t "${pkgdir}/usr/bin/"
}
