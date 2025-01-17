# Maintainer: Your Name <honighoenn@gmail.com>

pkgname=distrohoop-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A CLI Tool written in Rust that determines your next Distro :D! (Precompiled binary)"
arch=('x86_64')
url="https://github.com/br0sinski/distrohoop"
license=('MIT')
depends=()
source=("https://github.com/br0sinski/distrohoop/releases/download/$pkgver/distrohoop-linux-x64")
sha256sums=('SKIP') # Replace with the actual checksum for security

package() {
    install -Dm755 "$srcdir/distrohoop-linux-x64" "$pkgdir/usr/bin/distrohoop"

}

