# Maintainer: Marco Radocchia <marco.radocchia@outlook.com>
pkgname=qr-rs-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="A CLI utility to encode URLs or text into QR codes in various formats and colors"
arch=('x86_64')
url="https://github.com/marcoradocchia/qr-rs"
license=('GPL3')
depends=()
provides=('qr')
conflicts=('qr')
source=("https://github.com/marcoradocchia/qr-rs/releases/download/v${pkgver}/qr-rs-${pkgver}-x86_64-linux-gnu.tar.gz")
sha256sums=("dc8b2d007239737ccdea24cf800a9361792d4c9d71b6a48607274568cf0295ea")

package() {
    cd "$srcdir/"

    # Install binary.
    install -Dm755 qr -t "${pkgdir}/usr/bin/"
}
