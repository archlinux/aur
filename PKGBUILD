# Maintainer: Kartik Halkunde <your-email@example.com>
pkgname=crnch-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Blazing-fast Rust CLI tool for intelligent PNG/JPG/PDF compression (pre-built binary)"
arch=('x86_64')
url="https://github.com/KartikHalkunde/crnch"
license=('MIT')
depends=('ghostscript' 'imagemagick' 'pngquant' 'jpegoptim' 'oxipng')
provides=('crnch')
conflicts=('crnch')
source=("https://github.com/KartikHalkunde/crnch/releases/download/v${pkgver}/crnch-${pkgver}-x86_64-linux.tar.gz")
sha256sums=('7c25a75dc82bcf6aeb7470aa167576ee385a61c81ebf45995921e0284e1e61ac')

package() {
    install -Dm755 "crnch" "$pkgdir/usr/bin/crnch"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
