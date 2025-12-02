# Maintainer: Kartik Halkunde <your-email@example.com>
pkgname=crnch-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Blazing-fast Rust CLI tool for intelligent PNG/JPG/PDF compression (pre-built binary)"
arch=('x86_64')
url="https://github.com/KartikHalkunde/crnch"
license=('MIT')
depends=('ghostscript' 'imagemagick' 'pngquant' 'jpegoptim' 'oxipng')
provides=('crnch')
conflicts=('crnch')
source=("https://github.com/KartikHalkunde/crnch/releases/download/v${pkgver}/crnch-${pkgver}-x86_64-linux.tar.gz")
sha256sums=('361f42ec65bbff013fefe8c190fe2a843e501b5bfe09da2274c5665edfa39e41')

package() {
    install -Dm755 "crnch" "$pkgdir/usr/bin/crnch"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
